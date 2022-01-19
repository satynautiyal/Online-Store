// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application"
import "chartkick/chart.js"
var $ = require( "jquery" )
require("slick-carousel")

import "slick-carousel/slick/slick.scss"
import "slick-carousel/slick/slick-theme.scss"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.$ = jQuery;

document.addEventListener("turbolinks:load", function() {
    $('.slider-for').slick({
        prevArrow: $('.prev'),
        nextArrow: $('.next'),
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav'
      });
      $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: true,
        focusOnSelect: true
      });
     
      $('a[data-slide]').click(function(e) {
        e.preventDefault();
        var slideno = $(this).data('slide');
        $('.slider-nav').slick('slickGoTo', slideno - 1);
      });

      $('.products').slick({
        arrows: true,
        slidesToShow: 6,
        responsive: [{
          breakpoint: 1440,
          settings: {
            slidesToShow: 5
          }
        },{
          breakpoint: 1024,
          settings: {
            slidesToShow: 4
          }
        }, {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
          }
        }, {
          breakpoint: 320,
          settings: {
            slidesToShow: 1,
          }
        }, {
          breakpoint: 280,
          settings: {
            slidesToShow: 1,
          }
        }]
      });
  })
  

 
  

    