function Plot_vel_vs_press(p2, t2, v2)

subplot(1, 3, 1);
plot(p2, v2, 'r');
xlabel("Pressure");
ylabel("Velocity");
title("P2 vs V2");

subplot(1,3,2);
plot(t2, p2, 'b');
xlabel("Time");
ylabel("Pressure");
title("T2 vs P2");

subplot(1,3,3);
plot(t2, v2, 'k');
xlabel("Time");
ylabel("Velocity");
title("T2 vs V2");
axis tight;

end