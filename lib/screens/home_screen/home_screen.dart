import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_6/components/custom_app_bar.dart';
import 'package:weather_app_6/constants.dart';
import 'package:weather_app_6/screens/home_screen/components/hourly_weather_bar.dart';
import 'package:weather_app_6/screens/home_screen/components/weather_card.dart';

class HomeScreen extends StatelessWidget {
  // TODO (1): Extract this widget to _buildMainCard()
  Widget _buildMainCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Row(
            children: [
              Text(
                'Bandung,',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                'Indonesia',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w300,
                  fontSize: 21.0,
                  color: Color(0xFF676767),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          WeatherCard(),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  // TODO (2): Extract this widget to _buildColumn()
  Widget _buildColumn() {
    return Column(
      children: [
        _buildMainCard(),
        HourlyWeatherBar(padding: const EdgeInsets.symmetric(horizontal: 12.0)),
        const SizedBox(height: 30.0),
      ],
    );
  }

  // TODO (3): Create _buildRow()
  // TODO (4): Return the same as _buildColumn() but with Row

  // In Row()
  // TODO (5): Wrap _buildMain() with Container(maxWidth = 600)
  // TODO (6): Wrap HourlyWeatherBar() with Expanded

  Widget _buildRow() {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: _buildMainCard(),
        ),
        Expanded(
            child: HourlyWeatherBar(
                padding: const EdgeInsets.symmetric(horizontal: 12.0))),
        const SizedBox(height: 30.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // TODO (7): If width <= 900, child: _buildColumn(), else, child: _buildRow()
        child: width <= 900 ? _buildColumn() : _buildRow(),
      ),
    );
  }
}
