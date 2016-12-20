@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('nic_no') ? ' has-error' : '' }}">
                            <label for="nic_no" class="col-md-4 control-label">NIC no</label>

                            <div class="col-md-6">
                                <input id="nic_no" type="text" class="form-control" name="nic_no" required autofocus>
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('nic_no') ? ' has-error' : '' }}">
                            <label for="registration_no" class="col-md-4 control-label">Reg. no</label>

                            <div class="col-md-6">
                                <input id="registration_no" type="text" class="form-control" name="registration_no" required autofocus>
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('nic_no') ? ' has-error' : '' }}">
                            <label for="hospital_id" class="col-md-4 control-label">Hospital</label>

                            <div class="col-md-6">
                                <input id="hospital_id" type="text" class="form-control" name="hospital_id" required autofocus>
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('nic_no') ? ' has-error' : '' }}">
                            <label for="contact_no" class="col-md-4 control-label">Contact no</label>

                            <div class="col-md-6">
                                <input id="contact_no" type="text" class="form-control" name="contact_no" required autofocus>
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('nic_no') ? ' has-error' : '' }}">
                            <label for="user_type" class="col-md-4 control-label">User type</label>

                            <div class="col-md-6">
                                <label class="radio-inline">
                                    <input type="radio" name="user_type" value="doctor" required autofocus>Doctor
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="user_type" value="medical_officer" required autofocus>Medical Officer
                                </label>
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
