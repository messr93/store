<!DOCTYPE html>
<html lang="en" dir="{{app()->getLocale() == 'ar'? 'rtl': 'ltr'}}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Admin panel</title>
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{asset('backend')}}/plugins/fontawesome-free/css/all.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{asset('backend')}}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

    @if(app()->getLocale() == 'ar')
        <!-- bootstrap rtl -->
        <link rel="stylesheet" href="{{asset('backend')}}/dist/css/rtl/adminlte.min.css">
        <link rel="stylesheet" href="{{asset('backend')}}/dist/css/rtl/bootstrap-rtl.min.css">
        <!-- template rtl version -->
        <link rel="stylesheet" href="{{asset('backend')}}/dist/css/rtl/custom-style.css">

    @else
        <!-- Theme style -->
        <link rel="stylesheet" href="{{asset('backend')}}/dist/css/adminlte.min.css">
    @endif

    <!-- Datatable -->
    <link rel="stylesheet" href="{{asset('vendor/datatables//css/jquery.dataTables.min.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/datatables//css/buttons.dataTables.min.css')}}">
    <!-- Select2 -->
    <link rel="stylesheet" href="{{asset('vendor/select2/select2.min.css')}}">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    @stack('css')
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">
    @include('backend.includes.header')
    @include('backend.includes.menu_side_bar')

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{{ !empty($pageTitle)? $pageTitle :'Empty title' }}</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">{{__('backend.Home')}}</a></li>
                            <li class="breadcrumb-item active"> {{ !empty($pageTitle)? $pageTitle :'Empty title' }}</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                @include('backend.includes.flash-messages')
                @yield('content')
            </div><!--/. container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    @include('backend.includes.control_side_bar')

    @include('backend.includes.footer')
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="{{asset('backend')}}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="{{asset('backend')}}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="{{asset('backend')}}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="{{asset('backend')}}/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="{{asset('backend')}}/dist/js/demo.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="{{asset('backend')}}/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="{{asset('backend')}}/plugins/raphael/raphael.min.js"></script>
<script src="{{asset('backend')}}/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="{{asset('backend')}}/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="{{asset('backend')}}/plugins/chart.js/Chart.min.js"></script>

<!-- PAGE SCRIPTS -->
<script src="{{asset('backend')}}/dist/js/pages/dashboard2.js"></script>

<!-- Datatable -->
<script src="{{asset('vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('vendor/datatables/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('vendor/datatables/js/buttons.server-side.js')}}"></script>

<!-- Select2 -->
<script src="{{asset('vendor/select2/select2.min.js')}}"></script>


@stack('js')
</body>
</html>
