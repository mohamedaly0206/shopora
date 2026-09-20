import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Shopora'**
  String get appName;

  /// No description provided for @authLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLogin;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authSignUp;

  /// No description provided for @authWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get authWelcomeBack;

  /// No description provided for @authSignInToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your Shopora account'**
  String get authSignInToYourAccount;

  /// No description provided for @authCreateYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get authCreateYourAccount;

  /// No description provided for @authJoinShopora.
  ///
  /// In en, this message translates to:
  /// **'Join Shopora to unlock exclusive flash discounts, free priority express shipping, and member perks.'**
  String get authJoinShopora;

  /// No description provided for @authLoginNow.
  ///
  /// In en, this message translates to:
  /// **'Login Now'**
  String get authLoginNow;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPassword;

  /// No description provided for @authNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get authNewPassword;

  /// No description provided for @authCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get authCurrentPassword;

  /// No description provided for @authPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get authPhone;

  /// No description provided for @authUserName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get authUserName;

  /// No description provided for @authFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get authFullName;

  /// No description provided for @authGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get authGender;

  /// No description provided for @authFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get authFemale;

  /// No description provided for @authMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get authMale;

  /// No description provided for @authEnterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEnterYourEmail;

  /// No description provided for @authEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get authEnterYourPassword;

  /// No description provided for @authEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get authEnterPassword;

  /// No description provided for @authEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get authEnterPhoneNumber;

  /// No description provided for @authEnterYourUserName.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get authEnterYourUserName;

  /// No description provided for @authEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get authEnterFullName;

  /// No description provided for @authEnterYourLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get authEnterYourLastName;

  /// No description provided for @authHintFirstNameText.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get authHintFirstNameText;

  /// No description provided for @authRememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get authRememberMe;

  /// No description provided for @authForgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get authForgetPassword;

  /// No description provided for @authDoNotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get authDoNotHaveAnAccount;

  /// No description provided for @authAlreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get authAlreadyHaveAnAccount;

  /// No description provided for @authSignInToExploreMore.
  ///
  /// In en, this message translates to:
  /// **'Sign in to explore more'**
  String get authSignInToExploreMore;

  /// No description provided for @authContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get authContinueAsGuest;

  /// No description provided for @authGuestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get authGuestUser;

  /// No description provided for @authSignInRequired.
  ///
  /// In en, this message translates to:
  /// **'Sign in required'**
  String get authSignInRequired;

  /// No description provided for @authLoginSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get authLoginSuccessfully;

  /// No description provided for @authSignUpSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get authSignUpSuccessMessage;

  /// No description provided for @authCreatingAnAccountYouAgreeToOur.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to our'**
  String get authCreatingAnAccountYouAgreeToOur;

  /// No description provided for @authTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get authTermsAndConditions;

  /// No description provided for @authEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email associated with\nyour account'**
  String get authEnterEmail;

  /// No description provided for @authEmailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get authEmailVerification;

  /// No description provided for @authEnterCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code sent to your\nemail address'**
  String get authEnterCode;

  /// No description provided for @authInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get authInvalidCode;

  /// No description provided for @authDidNotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get authDidNotReceiveCode;

  /// No description provided for @authResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get authResend;

  /// No description provided for @authConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get authConfirm;

  /// No description provided for @authResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get authResetPassword;

  /// No description provided for @authResetPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least 8 characters,\nincluding uppercase, lowercase, number and symbol'**
  String get authResetPasswordHint;

  /// No description provided for @authPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get authPasswordRequired;

  /// No description provided for @authPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get authPasswordLength;

  /// No description provided for @authPasswordInvalid.
  ///
  /// In en, this message translates to:
  /// **'Password must contain uppercase, lowercase, number and symbol'**
  String get authPasswordInvalid;

  /// No description provided for @authPasswordNotMatched.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get authPasswordNotMatched;

  /// No description provided for @authEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get authEmailRequired;

  /// No description provided for @authEmailNotValid.
  ///
  /// In en, this message translates to:
  /// **'This email is not valid'**
  String get authEmailNotValid;

  /// No description provided for @authPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get authPhoneRequired;

  /// No description provided for @authPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid Egyptian phone number'**
  String get authPhoneInvalid;

  /// No description provided for @authFieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get authFieldRequired;

  /// No description provided for @authFullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full Name is required'**
  String get authFullNameRequired;

  /// No description provided for @authNameLength.
  ///
  /// In en, this message translates to:
  /// **'Full Name must be at least 3 characters'**
  String get authNameLength;

  /// No description provided for @authNameOnlyLetters.
  ///
  /// In en, this message translates to:
  /// **'Full Name must contain letters only'**
  String get authNameOnlyLetters;

  /// No description provided for @authNameNoSpaces.
  ///
  /// In en, this message translates to:
  /// **'Full Name cannot contain spaces'**
  String get authNameNoSpaces;

  /// No description provided for @homeHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeHome;

  /// No description provided for @homeSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get homeSearch;

  /// No description provided for @homeCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get homeCategories;

  /// No description provided for @homeViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get homeViewAll;

  /// No description provided for @homeBestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best Sellers'**
  String get homeBestSeller;

  /// No description provided for @homeDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get homeDiscount;

  /// No description provided for @homeNewProduct.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get homeNewProduct;

  /// No description provided for @homeSearchForAnyProduct.
  ///
  /// In en, this message translates to:
  /// **'Search for any product you want'**
  String get homeSearchForAnyProduct;

  /// No description provided for @homeNoProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get homeNoProductsFound;

  /// No description provided for @homeNoProductsFoundInThisCategory.
  ///
  /// In en, this message translates to:
  /// **'No products found in this category'**
  String get homeNoProductsFoundInThisCategory;

  /// No description provided for @productAddToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get productAddToCart;

  /// No description provided for @productDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get productDescription;

  /// No description provided for @productStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get productStatus;

  /// No description provided for @productInStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get productInStock;

  /// No description provided for @productOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get productOutOfStock;

  /// No description provided for @productPricesIncludedTax.
  ///
  /// In en, this message translates to:
  /// **'All prices include tax'**
  String get productPricesIncludedTax;

  /// No description provided for @productEgp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get productEgp;

  /// No description provided for @cartCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartCart;

  /// No description provided for @cartItems.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get cartItems;

  /// No description provided for @cartSubTotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get cartSubTotal;

  /// No description provided for @cartDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get cartDeliveryFee;

  /// No description provided for @cartTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get cartTotal;

  /// No description provided for @cartEmptyCart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty 🛒\nStart shopping and find something you\'ll love!'**
  String get cartEmptyCart;

  /// No description provided for @cartSuccessAddToCart.
  ///
  /// In en, this message translates to:
  /// **'Item added to cart'**
  String get cartSuccessAddToCart;

  /// No description provided for @cartCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get cartCheckout;

  /// No description provided for @cartPlaceOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get cartPlaceOrder;

  /// No description provided for @checkoutCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutCheckout;

  /// No description provided for @checkoutDeliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get checkoutDeliveryTime;

  /// No description provided for @checkoutInstant.
  ///
  /// In en, this message translates to:
  /// **'Instant'**
  String get checkoutInstant;

  /// No description provided for @checkoutSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get checkoutSchedule;

  /// No description provided for @checkoutDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get checkoutDeliveryAddress;

  /// No description provided for @checkoutAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get checkoutAddNew;

  /// No description provided for @checkoutPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get checkoutPaymentMethod;

  /// No description provided for @checkoutCashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get checkoutCashOnDelivery;

  /// No description provided for @checkoutCreditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get checkoutCreditCard;

  /// No description provided for @checkoutCreditCardPayment.
  ///
  /// In en, this message translates to:
  /// **'Credit Card Payment'**
  String get checkoutCreditCardPayment;

  /// No description provided for @checkoutCreditCardPaymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Credit card payment was not completed'**
  String get checkoutCreditCardPaymentFailed;

  /// No description provided for @checkoutItIsGift.
  ///
  /// In en, this message translates to:
  /// **'This is a gift'**
  String get checkoutItIsGift;

  /// No description provided for @checkoutNoPaymentMethodOrAddressSelected.
  ///
  /// In en, this message translates to:
  /// **'No payment method or address selected'**
  String get checkoutNoPaymentMethodOrAddressSelected;

  /// No description provided for @checkoutRecipientName.
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get checkoutRecipientName;

  /// No description provided for @checkoutEnterRecipientName.
  ///
  /// In en, this message translates to:
  /// **'Enter recipient name'**
  String get checkoutEnterRecipientName;

  /// No description provided for @checkoutAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get checkoutAddress;

  /// No description provided for @checkoutEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get checkoutEnterAddress;

  /// No description provided for @checkoutCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get checkoutCity;

  /// No description provided for @checkoutArea.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get checkoutArea;

  /// No description provided for @checkoutSaveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get checkoutSaveAddress;

  /// No description provided for @checkoutSavedAddress.
  ///
  /// In en, this message translates to:
  /// **'Saved Address'**
  String get checkoutSavedAddress;

  /// No description provided for @checkoutAddNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get checkoutAddNewAddress;

  /// No description provided for @addressAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressAddress;

  /// No description provided for @addressAddAddress.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addressAddAddress;

  /// No description provided for @addressEditAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get addressEditAddress;

  /// No description provided for @addressAddNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addressAddNewAddress;

  /// No description provided for @addressRecipientName.
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get addressRecipientName;

  /// No description provided for @addressEnterRecipientName.
  ///
  /// In en, this message translates to:
  /// **'Enter recipient name'**
  String get addressEnterRecipientName;

  /// No description provided for @addressGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get addressGovernorate;

  /// No description provided for @addressSelectGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Select governorate'**
  String get addressSelectGovernorate;

  /// No description provided for @addressCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get addressCity;

  /// No description provided for @addressSelectCity.
  ///
  /// In en, this message translates to:
  /// **'Select city'**
  String get addressSelectCity;

  /// No description provided for @addressArea.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get addressArea;

  /// No description provided for @addressStreetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street Address'**
  String get addressStreetAddress;

  /// No description provided for @addressEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get addressEnterAddress;

  /// No description provided for @addressSaveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get addressSaveAddress;

  /// No description provided for @addressRecipientNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Recipient name is required'**
  String get addressRecipientNameRequired;

  /// No description provided for @addressGovernorateRequired.
  ///
  /// In en, this message translates to:
  /// **'Governorate is required'**
  String get addressGovernorateRequired;

  /// No description provided for @addressCityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get addressCityRequired;

  /// No description provided for @addressStreetAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Street address is required'**
  String get addressStreetAddressRequired;

  /// No description provided for @addressStreetAddressMinLength.
  ///
  /// In en, this message translates to:
  /// **'Street address must be at least 5 characters'**
  String get addressStreetAddressMinLength;

  /// No description provided for @addressSelectLocationOnMap.
  ///
  /// In en, this message translates to:
  /// **'Please select a location on the map'**
  String get addressSelectLocationOnMap;

  /// No description provided for @addressAddressSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address saved successfully'**
  String get addressAddressSavedSuccessfully;

  /// No description provided for @addressAddressUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address updated successfully'**
  String get addressAddressUpdatedSuccessfully;

  /// No description provided for @addressAddressNotFound.
  ///
  /// In en, this message translates to:
  /// **'Address not found. Please try again.'**
  String get addressAddressNotFound;

  /// No description provided for @addressFailedLoadLocations.
  ///
  /// In en, this message translates to:
  /// **'Failed to load governorates and cities'**
  String get addressFailedLoadLocations;

  /// No description provided for @addressLocationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled'**
  String get addressLocationServicesDisabled;

  /// No description provided for @addressLocationPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required'**
  String get addressLocationPermissionRequired;

  /// No description provided for @addressLocationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied'**
  String get addressLocationPermissionDeniedForever;

  /// No description provided for @addressFailedGetCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Failed to get current location'**
  String get addressFailedGetCurrentLocation;

  /// No description provided for @addressNoSavedAddressFound.
  ///
  /// In en, this message translates to:
  /// **'No saved address found'**
  String get addressNoSavedAddressFound;

  /// No description provided for @addressNoSavedAddressesYet.
  ///
  /// In en, this message translates to:
  /// **'You have no saved addresses yet'**
  String get addressNoSavedAddressesYet;

  /// No description provided for @addressTapToAddFirstAddress.
  ///
  /// In en, this message translates to:
  /// **'Tap here to add your first address'**
  String get addressTapToAddFirstAddress;

  /// No description provided for @addressAddYourFirstAddress.
  ///
  /// In en, this message translates to:
  /// **'Add your first address'**
  String get addressAddYourFirstAddress;

  /// No description provided for @ordersTrackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get ordersTrackOrder;

  /// No description provided for @ordersOrderPlacedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your order was placed successfully!'**
  String get ordersOrderPlacedSuccessfully;

  /// No description provided for @ordersOrderPlacedMessage.
  ///
  /// In en, this message translates to:
  /// **'Once your order has been accepted,\nyou can track your order.'**
  String get ordersOrderPlacedMessage;

  /// No description provided for @ordersOrderDelivered.
  ///
  /// In en, this message translates to:
  /// **'Order Delivered'**
  String get ordersOrderDelivered;

  /// No description provided for @ordersOrderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get ordersOrderDetails;

  /// No description provided for @ordersMyOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get ordersMyOrders;

  /// No description provided for @ordersActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get ordersActive;

  /// No description provided for @ordersCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get ordersCompleted;

  /// No description provided for @ordersReorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get ordersReorder;

  /// No description provided for @ordersNoActiveOrdersFound.
  ///
  /// In en, this message translates to:
  /// **'No active orders found'**
  String get ordersNoActiveOrdersFound;

  /// No description provided for @ordersNoCompletedOrdersFound.
  ///
  /// In en, this message translates to:
  /// **'No completed orders found'**
  String get ordersNoCompletedOrdersFound;

  /// No description provided for @ordersOrderReceived.
  ///
  /// In en, this message translates to:
  /// **'Order Received'**
  String get ordersOrderReceived;

  /// No description provided for @ordersOrderPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing Your Order'**
  String get ordersOrderPreparing;

  /// No description provided for @ordersOrderOutForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Out for Delivery'**
  String get ordersOrderOutForDelivery;

  /// No description provided for @ordersDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get ordersDelivered;

  /// No description provided for @ordersDeliveryHeroToday.
  ///
  /// In en, this message translates to:
  /// **'Your delivery partner today'**
  String get ordersDeliveryHeroToday;

  /// No description provided for @ordersArriveBy.
  ///
  /// In en, this message translates to:
  /// **'Arrive By'**
  String get ordersArriveBy;

  /// No description provided for @ordersEstimatedArrival.
  ///
  /// In en, this message translates to:
  /// **'Estimated Arrival'**
  String get ordersEstimatedArrival;

  /// No description provided for @ordersShowMap.
  ///
  /// In en, this message translates to:
  /// **'Show Map'**
  String get ordersShowMap;

  /// No description provided for @profileProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileProfile;

  /// No description provided for @profileNotification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotification;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get profileAboutUs;

  /// No description provided for @profileChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get profileChangeLanguage;

  /// No description provided for @profileArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get profileArabic;

  /// No description provided for @profileEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get profileEnglish;

  /// No description provided for @profileUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get profileUpdate;

  /// No description provided for @profileChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get profileChange;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @profileConfirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout?'**
  String get profileConfirmLogout;

  /// No description provided for @profileCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancel;

  /// No description provided for @guestGuestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestGuestUser;

  /// No description provided for @guestSignInToExploreMore.
  ///
  /// In en, this message translates to:
  /// **'Sign in to explore more'**
  String get guestSignInToExploreMore;

  /// No description provided for @guestContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get guestContinueAsGuest;

  /// No description provided for @guestLoginNow.
  ///
  /// In en, this message translates to:
  /// **'Login Now'**
  String get guestLoginNow;

  /// No description provided for @guestToManageYourSavedAddressesPleaseLogin.
  ///
  /// In en, this message translates to:
  /// **'To manage your saved addresses, please log in.'**
  String get guestToManageYourSavedAddressesPleaseLogin;

  /// No description provided for @guestToManageYourOrdersPleaseLogin.
  ///
  /// In en, this message translates to:
  /// **'To manage your orders, please log in.'**
  String get guestToManageYourOrdersPleaseLogin;

  /// No description provided for @guestPleaseSignInToAddItemsToYourCartAndEnjoyFullShoppingFeatures.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to add items to your cart and enjoy full shopping features'**
  String get guestPleaseSignInToAddItemsToYourCartAndEnjoyFullShoppingFeatures;

  /// No description provided for @searchSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchSearch;

  /// No description provided for @searchFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get searchFilter;

  /// No description provided for @searchSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get searchSortBy;

  /// No description provided for @searchLowestPrice.
  ///
  /// In en, this message translates to:
  /// **'Lowest Price'**
  String get searchLowestPrice;

  /// No description provided for @searchHighestPrice.
  ///
  /// In en, this message translates to:
  /// **'Highest Price'**
  String get searchHighestPrice;

  /// No description provided for @searchNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get searchNewest;

  /// No description provided for @searchOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get searchOldest;

  /// No description provided for @searchDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get searchDiscount;

  /// No description provided for @navigationHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navigationHome;

  /// No description provided for @navigationCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get navigationCart;

  /// No description provided for @navigationProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navigationProfile;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get commonChange;

  /// No description provided for @commonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get commonUpdate;

  /// No description provided for @commonAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get commonAddNew;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get commonLoading;

  /// No description provided for @commonStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get commonStatus;

  /// No description provided for @networkStoreCacheExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to store data locally. Please try again later.'**
  String get networkStoreCacheExceptionMessage;

  /// No description provided for @networkGetCacheExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to get data locally. Please try again later.'**
  String get networkGetCacheExceptionMessage;

  /// No description provided for @networkCacheStorageError.
  ///
  /// In en, this message translates to:
  /// **'Storage Error'**
  String get networkCacheStorageError;

  /// No description provided for @networkErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later.'**
  String get networkErrorMessage;

  /// No description provided for @networkServerConnTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout with API server'**
  String get networkServerConnTimeout;

  /// No description provided for @networkServerSendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send timeout with API server'**
  String get networkServerSendTimeout;

  /// No description provided for @networkServerRecTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout with API server'**
  String get networkServerRecTimeout;

  /// No description provided for @networkServerCertError.
  ///
  /// In en, this message translates to:
  /// **'Bad certificate with API server'**
  String get networkServerCertError;

  /// No description provided for @networkServerCancel.
  ///
  /// In en, this message translates to:
  /// **'Request to API server was cancelled'**
  String get networkServerCancel;

  /// No description provided for @networkServerConnError.
  ///
  /// In en, this message translates to:
  /// **'There is a connection error'**
  String get networkServerConnError;

  /// No description provided for @networkServerNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get networkServerNoInternet;

  /// No description provided for @networkServerInvalidCreds.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get networkServerInvalidCreds;

  /// No description provided for @networkServerNotFound.
  ///
  /// In en, this message translates to:
  /// **'Sorry, something went wrong. Please try again.'**
  String get networkServerNotFound;

  /// No description provided for @networkServerInternalError.
  ///
  /// In en, this message translates to:
  /// **'Internal server error. Please try again later.'**
  String get networkServerInternalError;

  /// No description provided for @networkServerDefaultError.
  ///
  /// In en, this message translates to:
  /// **'Sorry, something went wrong. Please try again.'**
  String get networkServerDefaultError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
