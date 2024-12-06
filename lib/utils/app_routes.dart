import 'package:coloring_app/src/view/auth/auth_screen.dart';
import 'package:coloring_app/src/view/auth/components/forgot_password_screen.dart';
import 'package:coloring_app/src/view/bottom_navigationbar.dart';
import 'package:coloring_app/src/view/collection/collection_screen.dart';
import 'package:coloring_app/src/view/mycreations/mycreation_screen.dart';
import 'package:coloring_app/src/view/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../src/view/auth/components/new_password_screen.dart';
import '../src/view/auth/components/verification.dart';
import '../src/view/collection/collection_detail_screen.dart';
import '../src/view/colorpage/color_screen.dart';
import '../src/view/colorpage/preview_screen.dart';
import '../src/view/colorpage/testing_color.dart';
import '../src/view/notifications/notification_screen.dart';
import '../src/view/orders/card_screen.dart';
import '../src/view/orders/order_overview_screen.dart';
import '../src/view/orders/order_receipt_screen.dart';
import '../src/view/orders/payment_method_screen.dart';
import '../src/view/orders/print_order_screen.dart';
import '../src/view/profile/edit_profile/edit_profile.dart';
import '../src/view/profile/help/help_support_screen.dart';
import '../src/view/profile/orderhistory/order_details_screen.dart';
import '../src/view/profile/orderhistory/order_history_screen.dart';
import '../src/view/profile/recentactivity/recent_activity_screen.dart';
import '../src/view/profile/settings/change_password_screen.dart';
import '../src/view/profile/settings/otpscreen.dart';
import '../src/view/profile/settings/settings_screen.dart';
import '../src/view/splash/logo_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const LogoScreen(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/forgotpassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) => const VerificationScreen(),
    ),
    GoRoute(
      path: '/newpassword',
      builder: (context, state) => const NewPasswordScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const BottomNavigationScreen(),
    ),
    GoRoute(
      path: '/editprofile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/changepassword',
      builder: (context, state) => const ChangePasswordScreen(),
    ),
    GoRoute(
      path: '/help',
      builder: (context, state) => const HelpSupportScreen(),
    ),
    GoRoute(
      path: '/otpscreen',
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: '/recentactivity',
      builder: (context, state) => const RecentActivityScreen(),
    ),
    GoRoute(
      path: '/orderhistory',
      builder: (context, state) => const OrderHistoryScreen(),
    ),
    GoRoute(
      path: '/mycreations',
      builder: (context, state) => const MycreationScreen(),
    ),
    GoRoute(
      path: '/templates',
      builder: (context, state) => const TemplateCollectionScreen(),
    ),
    GoRoute(
      path: '/templatesdetails',
      builder: (context, state) => const CollectionDetailScreen(),
    ),
    GoRoute(
      path: '/orderdetail',
      builder: (context, state) => const OrderDetailsScreen(),
    ),
    GoRoute(
      path: '/coloring',
      builder: (context, state) => const ColoringScreen(),
    ),
    GoRoute(
      path: '/preview',
      builder: (context, state) => const PreviewScreen(),
    ),
    GoRoute(
      path: '/printscreen',
      builder: (context, state) => const PrintOrderScreen(),
    ),
    GoRoute(
      path: '/orderoverview',
      builder: (context, state) => const OrderOverviewScreen(),
    ),
    GoRoute(
      path: '/paymentmethod',
      builder: (context, state) => const PaymentMethodScreen(),
    ),
    GoRoute(
      path: '/cardpayment',
      builder: (context, state) => const CardPaymentScreen(),
    ),
    GoRoute(
      path: '/receipt',
      builder: (context, state) => const OrderReceiptScreen(),
    ),
    // GoRoute(
    //   path: '/test',
    //   builder: (context, state) => const DrawingPage(),
    // ),
  ],
);
