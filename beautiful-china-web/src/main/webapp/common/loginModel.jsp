<script src="/js/login/loginModel.js"></script>
<!-- 模态框（Modal） -->
<div class="modal fade" id="loginFirst" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 350px;margin-top: 100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 align="center" class="modal-title">
                    <div class="text-center"><img src="/img/logo_black.png" alt="" data-retina="true"></div>
                </h4>
            </div>
            <div class="modal-body">
                <form id="loginForm">
                    <fieldset>
                        <div class="form-group">
                            <div id="login-check2" class="clearfix"></div>
                            <label><spring:message code="Email"/></label>
                            <input type="text" class=" form-control " id="nickName" name="nickName"
                                   placeholder="<spring:message code="Email"/>" required>
                        </div>
                        <div id="nickname-check" class="clearfix"></div>
                        <div class="form-group">
                            <label><spring:message code="Password"/></label>
                            <input type="password" class=" form-control" id="password" name="password"
                                   placeholder="<spring:message code="Password"/>">
                        </div>
                        <div id="pwd-check" class="clearfix"></div>
                        <p class="small">
                            <a href="forget"><spring:message code="ForgotPwd"/></a>
                        </p>
                        <input type="button" class="btn_full" style="width: 100%;" id="log_in" value="<spring:message code="Login"/>">
                        <a href="register" class="btn_full_outline"><spring:message code="Register"/></a>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<style>
    body {
        padding-right: 0px !important;
    }

</style>