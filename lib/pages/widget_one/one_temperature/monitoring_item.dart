import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring/db_pool/monitoring_entity.dart';
import 'package:monitoring/main.dart';
import 'package:styled_widget/styled_widget.dart';

class MonitoringItem extends StatelessWidget {
  const MonitoringItem(this.entity, {Key? key}) : super(key: key);

  final MonitoringEntity entity;

  void showDialog() {
    Get.dialog(Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 356,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            width: double.infinity,
            height: 330,
            child: <Widget>[
              Text(
                ['Temperature value', 'Blood value', 'Heart value', 'Respiratory rate (min)'][entity.type.index],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black, decorationThickness: 0),
              ).marginOnly(top: 10),
              Text('${entity.inputNumber}${entity.unit}',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, decorationThickness: 0))
                  .marginSymmetric(vertical: 15),
              Container(
                padding: const EdgeInsets.all(20),
                child: <Widget>[
                  Text(
                    entity.isNormal ? 'Normal' : 'Out',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: entity.isNormal ? Colors.green : Colors.orange,
                        decorationThickness: 0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    entity.isNormal
                        ? 'For reference only, please contact your doctor if you have any adverse reactions.'
                        : 'Seek the advice of your doctor before making a medical decision.',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decorationThickness: 0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ].toColumn(),
              ).decorated(
                  color: entity.isNormal
                      ? const Color(0xffd6feef)
                      : const Color(0xfffffaeb),
                  borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 184,
                  height: 50,
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        decorationThickness: 0),
                  ),
                ).decorated(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                onTap: () {
                  Get.back();
                },
              )
            ].toColumn(),
          )
              .decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginOnly(top: 30),
          <Widget>[entity.icon]
              .toRow(mainAxisAlignment: MainAxisAlignment.center)
        ],
      ),
    ).marginSymmetric(horizontal: 15));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: <Widget>[
          <Widget>[
            Text(
              '${entity.inputNumber}${entity.unit}',
              style: TextStyle(
                  fontSize: 24,
                  color: entity.leftTitleColor,
                  fontWeight: FontWeight.bold),
            ),
            <Widget>[
              Text(
                entity.rightStatusTitle,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: entity.rightStatusColor),
              ),
              Text(
                entity.time,
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.withOpacity(0.6)),
              )
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.end)
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          Divider(
            height: 15,
            color: Colors.grey.withOpacity(0.3),
          )
        ].toColumn(),
      ),
      onTap: () {
        showDialog();
      },
    );
  }
}
