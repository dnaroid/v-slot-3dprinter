module electric_asm()
{
  T(-short - 15, -short + 15)
  R(180, 0, 180)
  microswitch(medium_microswitch);

  T(-short - 15, car_y)
  // R(180, 0, 180)
  microswitch(medium_microswitch);
}

electric_asm();
