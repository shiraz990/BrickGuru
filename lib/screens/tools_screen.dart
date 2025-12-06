import 'package:flutter/material.dart';
import 'package:ask_abc/utils/app_localizations.dart';
import 'package:ask_abc/screens/bag_calculator_screen.dart';
import 'package:ask_abc/screens/curing_planner_screen.dart';
import 'package:ask_abc/screens/cost_estimator_screen.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.tools),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ToolCard(
            title: localizations.bagCalculator,
            description: 'Calculate the number of bags needed for your project',
            icon: Icons.calculate_outlined,
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BagCalculatorScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _ToolCard(
            title: localizations.curingPlanner,
            description: 'Plan and track curing schedules with reminders',
            icon: Icons.calendar_today_outlined,
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CuringPlannerScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _ToolCard(
            title: localizations.costEstimator,
            description: 'Estimate material costs and quantities',
            icon: Icons.attach_money_outlined,
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CostEstimatorScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ToolCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ToolCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }
}

