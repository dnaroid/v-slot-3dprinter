module electric_asm()
{
  T(-short - 15, -short + 15)
  R(180, 0, 180)
  microswitch(medium_microswitch);

  T(-short + 22, car_y, 5)
  R(0, 0, -90)
  microswitch(medium_microswitch);
}

electric_asm();