<style>
    label.msg_error {
        font-size: 11px;
        color: red;
    }
</style>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-sm-4">
                <h3><spring:message code="NeedHelp"/>?</h3>
                <a href="#" id="phone">1855-695-7770</a>
                <a href="#" id="email_footer">info@bchina.com</a>
            </div>
            <div class="col-md-4 col-sm-4">
                <h3><spring:message code="About"/></h3>
                <ul>
                    <li><a href="/about"><spring:message code="AboutUs"/></a></li>
                    <%--<li><a href="#">FAQ</a></li>--%>
                    <li><a href="/login"><spring:message code="Login"/></a></li>
                    <li><a href="/register?type=N"><spring:message code="Register"/></a></li>
                    <li><a href="/suppliersin"><spring:message code="SuppliersIn"/></a></li>
                    <li><a href="/agentin?type=A"><spring:message code="AgentIn"/></a></li>
                    <li><a href="javascript:void(0);" data-toggle="modal" data-target="#suggestions" id="sug-open"
                           style="color: white"><spring:message code="Suggestions"/></a>
                    </li>
                    <%--<li><a href="#"><spring:message code="TermsAndCondition"/></a></li>--%>
                </ul>
            </div>
            <%--<div class="col-md-3 col-sm-3">--%>
            <%--<h3><spring:message code="Discover"/></h3>--%>
            <%--<ul>--%>
            <%--<li><a href="#"><spring:message code="CommunityBlog"/></a></li>--%>
            <%--<li><a href="#"><spring:message code="TourGuide"/></a></li>--%>
            <%--<li><a href="#"><spring:message code="Wishlist"/></a></li>--%>
            <%--<li><a href="#"><spring:message code="Gallery"/></a></li>--%>
            <%--</ul>--%>
            <%--</div>--%>
            <%--<div class="col-md-3 col-sm-4">--%>
            <%--<h3><spring:message code="Settings"/></h3>--%>
            <%--<div class="styled-select">--%>
            <%--<select class="form-control" name="lang" id="lang" onchange="changeLanguage(this.value)">--%>
            <%--<option value="English" selected>English</option>--%>
            <%--<option value="French">French</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;<div class="styled-select">--%>
            <%--<select class="form-control" name="currency" id="currency">--%>
            <%--<option value="USD" selected>USD</option>--%>
            <%--<option value="EUR">EUR</option>--%>
            <%--<option value="GBP">GBP</option>--%>
            <%--<option value="RUB">RUB</option>--%>
            <%--</select>--%>
            <%--</div>&ndash;%&gt;--%>
            <%--</div>--%>
        </div>
        <!-- End row -->
        <div class="row">
            <div class="col-md-12">
                <div id="social_footer">
                    <ul>
                        <li><a href="#"><i class="icon-facebook"></i></a></li>
                        <li><a href="#"><i class="icon-twitter"></i></a></li>
                        <li><a href="#"><i class="icon-google"></i></a></li>
                        <li><a href="#"><i class="icon-instagram"></i></a></li>
                        <li><a href="#"><i class="icon-pinterest"></i></a></li>
                        <li><a href="#"><i class="icon-vimeo"></i></a></li>
                        <li><a href="#"><i class="icon-youtube-play"></i></a></li>
                        <li><a href="#"><i class="icon-linkedin"></i></a></li>
                    </ul>
                    <p>&copy;Beautiful China2016</p>
                </div>
            </div>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="suggestions" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-top: 6%;width: 900px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 align="left" class="modal-title">
                        suggestions
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="suggestionsForm" METHOD="post">
                        <div class="col-md-12 col-sm-12 ">
                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="nationality"/></label>
                                    <input id="sugCountry" name="sugCountry" class="form-control"
                                           placeholder="<spring:message code="nationality"/>">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="type"/></label>
                                    <select class="form-control" id="sugType" name="sugType">
                                        <option value="T"><spring:message code="Complaints"/></option>
                                        <option value="J"><spring:message code="Suggest"/></option>
                                        <option value="Q"><spring:message code="Recourse"/></option>
                                        <option value="Z"><spring:message code="Advisory"/></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 ">
                            <div class="col-md-3 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="Firstname"/></label>
                                    <input id="sugFirstname" name="sugFirstname" class="form-control"
                                           placeholder="<spring:message code="Firstname"/>">
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="Lastname"/></label>
                                    <input id="sugLastname" name="sugLastname" class="form-control"
                                           placeholder="<spring:message code="Lastname"/>">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="Sex"/></label>
                                    <select class="form-control" id="sugSex" name="sugSex">
                                        <option value="">-<spring:message code="SexMsg"/>-</option>
                                        <option value="F"><spring:message code="female"/></option>
                                        <option value="M"><spring:message code="male"/></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 ">
                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="Phone"/></label>
                                    <input id="sugPhone" name="sugPhone" class="form-control"
                                           placeholder="<spring:message code="Phone"/>">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label style="color: black;"><spring:message code="Email"/></label>
                                    <input id="sugEmail" name="sugEmail" class="form-control"
                                           placeholder="<spring:message code="Email"/>">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 ">
                            <div class="form-group">
                                <label style="color: black;"><spring:message code="SugDesc"/></label>
                                <textarea rows="5" id="sugDesc" name="sugDesc" class="form-control"
                                          placeholder="<spring:message code="SugDesc"/>"
                                          style="height:200px;"></textarea>
                            </div>

                        </div>
                        <div class="col-md-12 col-sm-12 " align="right">
                            <input type="button" id="saveSuggestion" class="btn btn-primary"
                                   value="<spring:message code="save"/>" onclick="insertSug()">
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center;border-top: none;">


                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <%@ include file="/common/loginModel.jsp" %>
</footer>
<!-- End footer -->
<div id="toTop"></div>
<!-- Back to top button -->
<script src="/js/common/footer.js"></script>
<script src="/js/common/jquery.validate.js"></script>
<script src="/js/suggestions/suggestions.js"></script>
<script>
    var notnull = "<spring:message code="required_100000"/>";
</script>