<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<?php
$total = 0;
$qry = $conn->query("SELECT c.*,p.product_name,i.size,i.price,p.id as pid from `cart` c inner join `inventory` i on i.id=c.inventory_id inner join products p on p.id = i.product_id where c.client_id = " . $_settings->userdata('id'));
while ($row = $qry->fetch_assoc()):
    $total += $row['price'] * $row['quantity'];
endwhile;

?>

<?php

$sumatotal = 0;
$sumatotal = $total * 0.15;
$total = $total + $sumatotal;


?>
<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body"></div>
            <h3 class="text-center"><b>Checkout</b></h3>
            <hr class="border-dark">
            <form action="" id="place_order">
                <input type="hidden" name="amount" value="<?php echo sprintf('%.2f', $total) ?>">
                <input type="hidden" name="payment_method" value="cod">
                <input type="hidden" name="paid" value="0">
                <div class="row row-col-1 justify-content-center">
                    <div class="col-6">
                        <div class="form-group col">
                            <label for="" class="control-label">Direccion de Envio</label>
                            <textarea id="" cols="30" rows="3" name="delivery_address" class="form-control" style="resize:none"><?php echo $_settings->userdata('default_delivery_address') ?></textarea>
                        </div>
                        <div class="col">
                            <span>
                                <h4><b>Total:</b> <?php echo $total ?></h4>
                            </span>
                        </div>
                        <hr>
                        <div class="col my-3">
                            <h4 class="text-muted">Metodo de Pago </h4>
                            <div class="d-flex w-100 justify-content-between">
                                <button class="btn btn-flat btn-dark">Contra Entrega</button>


                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>


<script>
    // Inicializar múltiples servicios de EmailJS
    emailjs.init("W5uLd9NBG0V1Eyx5Q");

    function getEmailProvider(email) {
        email = email.toLowerCase();
        if (email.includes('@gmail.com')) {
            return 'gmail';
        } else if (email.includes('@outlook.com') || email.includes('@hotmail.com')) {
            return 'outlook';
        }
        return 'default'; // Para otros proveedores de correo
    }

    function sendOrderConfirmation(orderDetails) {
        // Obtener el email del usuario desde PHP
        const userEmail = '<?php echo $_settings->userdata('email'); ?>';
        const orderTotal = '<?php echo $total; ?>';
        const provider = getEmailProvider(userEmail);

        // Preparar el template con los datos de la orden
        const templateParams = {
            to_email: userEmail,
            order_number: Date.now(), // Genera un número de orden único
            order_total: orderTotal,
            delivery_address: document.querySelector('[name="delivery_address"]').value,
        };

        // Seleccionar el servicio y template según el proveedor de correo
        let serviceId, templateId;

        switch (provider) {
            case 'gmail':
                serviceId = 'service_kw4h9p9'; // Tu ID de servicio para Gmail
                templateId = 'template_bztiuv8'; // Tu ID de template para Gmail
                break;
            case 'outlook':
                serviceId = 'service_f95350u'; // Tu ID de servicio para Outlook
                templateId = 'template_bztiuv8'; // Tu ID de template para Outlook
                break;
            default:
                serviceId = 'service_kw4h9p9'; // Servicio por defecto
                templateId = 'template_bztiuv8'; // Template por defecto
        }

        // Enviar el email usando EmailJS
        return emailjs.send(serviceId, templateId, templateParams);
    }

    $(function() {
        $('#place_order').submit(function(e) {
            e.preventDefault();
            start_loader();
            $.ajax({
                url: 'classes/Master.php?f=place_order',
                method: 'POST',
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err);
                    alert_toast("an error occured", "error");
                    end_loader();
                },
                success: function(resp) {
                    if (!!resp.status && resp.status == 'success') {
                        // Enviar email de confirmación
                        sendOrderConfirmation(resp)
                            .then(function(response) {
                                console.log('Email sent successfully:', response);
                                alert_toast("Order Successfully placed and confirmation email sent.", "success");
                                setTimeout(function() {
                                    location.replace('./');
                                }, 2000);
                            })
                            .catch(function(error) {
                                console.log('Email error:', error);
                                alert_toast("Order placed but email notification failed.", "warning");
                                setTimeout(function() {
                                    location.replace('./');
                                }, 2000);
                            });
                    } else {
                        console.log(resp);
                        alert_toast("an error occured", "error");
                        end_loader();
                    }
                }
            });
        });
    });

    function payment_online() {
        $('[name="payment_method"]').val("Online Payment");
        $('[name="paid"]').val(1);
        $('#place_order').submit();
    }
</script>

</script>