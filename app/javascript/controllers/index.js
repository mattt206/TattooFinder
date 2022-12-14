// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import HomeController from "./home_controller"
application.register("home", HomeController)

import LikesController from "./likes_controller"
application.register("likes", LikesController)

import MapController from "./map_controller"
application.register("map", MapController)

import VisibilityController from "./visibility_controller"
application.register("visibility", VisibilityController)
