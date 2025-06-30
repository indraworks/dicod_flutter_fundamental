import 'package:budgeting_reusable/models/transcation_item.dart';
import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionItem transactionItem;
  const TransactionItemWidget({super.key, required this.transactionItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),

      child: Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: Color(0xFFE5E7EB),
              offset: Offset(0, 1),
            ),
          ],
        ),
        //anaknya container
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),

          //anaknya Padding
          child: Row(
            mainAxisSize: MainAxisSize.max,
            //anak-anak row Container,Expanded
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0x4094895F),
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: const Color(0xFF6F61EF), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    child: Image.network(
                      transactionItem.image,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionItem.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            transactionItem.subtitle,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(
                              color: const Color(0xFF606A85),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                transactionItem.money,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: const Color(0xFF15161E),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
