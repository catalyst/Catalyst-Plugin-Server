package TestApp::Controller::Plugin::XMLRPC;

use strict;
use base 'Catalyst::Controller';

sub begin : Private {
    my ( $self, $c ) = @_;
    $c->res->header( 'X-Test-Class' => ref($self) );
}

sub rpc : Global : ActionClass('XMLRPC') {
#  my ($self, $c) = @_; 
#  $c->xmlrpc;
}

sub echo : XMLRPC('myAPI.echo') {
    my ( $self, $c, @args ) = @_;
    return join ' ', @args;
}

sub add : XMLRPC {
    my ( $self, $c, $a, $b ) = @_;
    return $a + $b;
}

1;
