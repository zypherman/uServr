<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome to uServr</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
</head>

<body id="page-top" class="index">

<!-- Header -->
<div class="main img-responsive">
    <div class="container">
        <div class="intro-text">
            <div class="intro-lead-in">Welcome To uServr!</div>

            <div class="intro-heading">Please select a view</div>

            <div class="btn-group-vertical">
                <g:link type="button" class="btn btn-xl btn-lg" controller="customer" action="index">Customer</g:link>
                <g:link type="button" class="btn btn-xl btn-lg" controller="kitchen" action="index">Kitchen</g:link>
                <g:link type="button" class="btn btn-xl btn-lg" controller="bar" action="index">Bar</g:link>
                <g:link type="button" class="btn btn-xl btn-lg">Manager</g:link>
            </div>
        </div>
    </div>
</div>

</body>

</html>
