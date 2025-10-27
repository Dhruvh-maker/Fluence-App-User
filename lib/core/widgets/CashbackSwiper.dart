import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/widgets/cashback_earned_card.dart';

class CashbackSwiper extends StatefulWidget {
  final List<dynamic> campaigns;
  const CashbackSwiper({super.key, required this.campaigns});

  @override
  State<CashbackSwiper> createState() => _CashbackSwiperState();
}

class _CashbackSwiperState extends State<CashbackSwiper> {
  final _controller = PageController();
  final _cards = [
    {'amount': 1230, 'currency': '\$'},
    {'amount': 8500, 'currency': '₹'},
    {'amount': 4420, 'currency': '€'},
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final campaigns = widget.campaigns;

    if (campaigns.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No active cashback campaigns',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _controller,
            itemCount: campaigns.length,
            itemBuilder: (context, index) {
              final campaign = campaigns[index];
              return CashbackEarnedCard(
                amount:
                    double.tryParse(
                      campaign['cashback_percentage'].toString(),
                    )?.round() ??
                    0,
                currency: '%', // bas visual indicator
                title: campaign['campaign_name'] ?? 'Cashback Offer',
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        SmoothPageIndicator(
          controller: _controller,
          count: campaigns.length,
          effect: WormEffect(
            activeDotColor: const Color(0xffD4AF37),
            dotColor: const Color(0xffD9D9D9),
            dotHeight: 10,
            dotWidth: 10,
            radius: 10,
          ),
        ),
      ],
    );
  }
}
