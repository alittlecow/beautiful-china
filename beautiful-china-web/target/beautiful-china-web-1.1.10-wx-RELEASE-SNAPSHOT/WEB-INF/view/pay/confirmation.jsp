<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
<head>

    <title>BEAUTIFUL CHINA</title>
    <%@ include file="/common/header.jsp"%>

</head>
<body>

    <%@ include file="/common/header.jsp"%>

<section id="hero_2">
    <div class="intro_title animated fadeInDown">
        <h1>Place your order</h1>
        <div class="bs-wizard">

            <div class="col-xs-4 bs-wizard-step complete">
                <div class="text-center bs-wizard-stepnum">Your cart</div>
                <div class="progress"><div class="progress-bar"></div></div>
                <a href="cart.html" class="bs-wizard-dot"></a>
            </div>

            <div class="col-xs-4 bs-wizard-step complete">
                <div class="text-center bs-wizard-stepnum">Your details</div>
                <div class="progress"><div class="progress-bar"></div></div>
                <a href="payment.html" class="bs-wizard-dot"></a>
            </div>

            <div class="col-xs-4 bs-wizard-step complete">
                <div class="text-center bs-wizard-stepnum">Finish!</div>
                <div class="progress"><div class="progress-bar"></div></div>
                <a href="#" class="bs-wizard-dot"></a>
            </div>

        </div>  <!-- End bs-wizard -->
    </div>   <!-- End intro-title -->
</section><!-- End Section hero_2 -->

<div id="position">
    <div class="container">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Category</a></li>
            <li>Page active</li>
        </ul>
    </div>
</div><!-- End position -->

<div class="container margin_60">
    <div class="row">
        <div class="col-md-8">

            <div class="form_title">
                <h3><strong><i class="icon-ok"></i></strong>Thank you!</h3>
                <p>
                    Mussum ipsum cacilds, vidis litro abertis.
                </p>
            </div>
            <div class="step">
                <p>
                    Lorem ipsum dolor sit amet, nostrud nominati vis ex, essent conceptam eam ad. Cu etiam comprehensam nec. Cibo delicata mei an, eum porro legere no. Te usu decore omnium, quem brute vis at, ius esse officiis legendos cu. Dicunt voluptatum at cum. Vel et facete equidem deterruisset, mei graeco cetero labores et. Accusamus inciderint eu mea.
                </p>
            </div><!--End step -->

            <div class="form_title">
                <h3><strong><i class="icon-tag-1"></i></strong>Booking summary</h3>
                <p>
                    Mussum ipsum cacilds, vidis litro abertis.
                </p>
            </div>
            <div class="step">
                <table class="table confirm">
                    <thead>
                    <tr>
                        <th colspan="2">
                            Item 1
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <strong>Louvre musuem tickets</strong>
                        </td>
                        <td>
                            2x
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Date</strong>
                        </td>
                        <td>
                            25 Febraury 2015
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>To</strong>
                        </td>
                        <td>
                            Jhon Doe
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Payment type</strong>
                        </td>
                        <td>
                            Credit card
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="table confirm">
                    <thead>
                    <tr>
                        <th colspan="2">
                            Item 2
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <strong>Senna river tour</strong>
                        </td>
                        <td>
                            2x
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Date</strong>
                        </td>
                        <td>
                            27 Febraury 2015
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>To</strong>
                        </td>
                        <td>
                            Jhon Doe
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Payment type</strong>
                        </td>
                        <td>
                            Credit card
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div><!--End step -->
        </div><!--End col-md-8 -->

        <aside class="col-md-4">
            <div class="box_style_1">
                <h3 class="inner">Thank you!</h3>
                <p>
                    Nihil inimicus ex nam, in ipsum dignissim duo. Tale principes interpretaris vim ei, has posidonium definitiones ut. Duis harum fuisset ut his, duo an dolor epicuri appareat.
                </p>
                <hr>
                <a class="btn_full_outline" href="invoice.html" target="_blank">View your invoice</a>
            </div>
            <div class="box_style_4">
                <i class="icon_set_1_icon-89"></i>
                <h4>Have <span>questions?</span></h4>
                <a href="tel://004542344599" class="phone">+45 423 445 99</a>
                <small>Monday to Friday 9.00am - 7.30pm</small>
            </div>
        </aside>

    </div><!--End row -->
</div><!--End container -->


    <!-- footer -->
    <%@include file="/common/footer.jsp" %>
    <!-- Common scripts -->
    <%@include file="/common/script.jsp" %>

<script src="/js/icheck.js"></script>
<script>
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-grey',
        radioClass: 'iradio_square-grey'
    });
</script>
</body>
</html>