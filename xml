<Window x:Class="BananaModLauncher.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="BananaMod Launcher" Height="650" Width="950" 
        WindowStyle="None" Background="#0f0f12" AllowsTransparency="True" WindowStartupLocation="CenterScreen">
    
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="220"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>

        <!-- SIDEBAR -->
        <Border Background="#141419" BorderBrush="#ffe600" BorderThickness="0,0,2,0" Grid.Column="0">
            <StackPanel Margin="20">
                <TextBlock Text="BananaMod" FontSize="26" FontWeight="Bold" Foreground="#ffe600" HorizontalAlignment="Center" Margin="0,0,0,40"/>
                <Button Content="Home" Click="ShowHome" Background="Transparent" Foreground="#ffe600" BorderThickness="0" Padding="10" Margin="0,0,0,10" FontSize="16" HorizontalContentAlignment="Left"/>
                <Button Content="Einstellungen" Click="ShowSettings" Background="Transparent" Foreground="#a0a0a5" BorderThickness="0" Padding="10" Margin="0,0,0,10" FontSize="16" HorizontalContentAlignment="Left"/>
                <Button Content="Profile (2/2)" Click="BuyProfile" Background="Transparent" Foreground="#a0a0a5" BorderThickness="0" Padding="10" Margin="0,0,0,10" FontSize="16" HorizontalContentAlignment="Left"/>
                <Button Content="Beenden" Click="CloseApp" Background="Transparent" Foreground="#ff4444" BorderThickness="0" Padding="10" Margin="0,150,0,0" FontSize="14"/>
            </StackPanel>
        </Border>

        <!-- MAIN INHALT -->
        <Grid Grid.Column="1" Margin="40">
            
            <!-- HOME SEITE -->
            <StackPanel x:Name="HomePage" Visibility="Visible" HorizontalAlignment="Center" VerticalAlignment="Center">
                <!-- Platzhalter für den Skin/Avatar -->
                <Border Width="120" Height="180" Background="#1c1c24" CornerRadius="8" BorderBrush="#2c2c35" BorderThickness="2" Margin="0,0,0,20">
                    <TextBlock Text="🍌" FontSize="48" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                </Border>
                <TextBox x:Name="UsernameInput" Width="250" Height="40" Background="#1c1c24" Foreground="White" BorderBrush="#2c2c35" BorderThickness="2" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" FontSize="16" Margin="0,0,0,20" GotFocus="ClearPlaceholder"/>
                <Button Content="LAUNCH" Click="LaunchGame" Background="#ffe600" Foreground="Black" FontWeight="Bold" FontSize="20" Width="200" Height="50" BorderThickness="0">
                    <Button.Resources>
                        <Style TargetType="Border"><Setter Property="CornerRadius" Value="8"/></Style>
                    </Button.Resources>
                </Button>
            </StackPanel>

            <!-- EINSTELLUNGEN SEITE -->
            <StackPanel x:Name="SettingsPage" Visibility="Collapsed" VerticalAlignment="Center" HorizontalAlignment="Stretch">
                <Border Background="#141419" BorderBrush="#2c2c35" BorderThickness="1" CornerRadius="12" Padding="30">
                    <StackPanel>
                        <TextBlock Text="Java Menü (System-Status)" FontSize="22" FontWeight="Bold" Foreground="#ffe600" Margin="0,0,0,20"/>
                        <TextBlock x:Name="CpuText" Text="CPU-Auslastung: 8%" FontSize="16" Foreground="White" Margin="0,0,0,10"/>
                        <TextBlock Text="RAM zugewiesen: 4096 MB" FontSize="16" Foreground="White" Margin="0,0,0,10"/>
                        <TextBlock Text="FPS &amp; Koordinaten: In-Game aktiv" FontSize="16" Foreground="White" Margin="0,0,0,10"/>
                        <TextBlock Text="GPS-Ortung: Schlierbach, Österreich" FontSize="16" Foreground="White" Margin="0,0,0,20"/>
                        
                        <!-- Das geheime CkAH Easter Egg -->
                        <TextBlock Text="CkAH" Foreground="#1c1c24" FontSize="14" Cursor="Hand" MouseDown="CkAH_Click" HorizontalAlignment="Left"/>

                        <!-- HACK CLIENT MENÜ (Standardmäßig unsichtbar) -->
                        <Border x:Name="HackMenu" Background="#22ff0000" BorderBrush="#ff0000" BorderThickness="2" CornerRadius="8" Padding="15" Margin="0,20,0,0" Visibility="Collapsed">
                            <StackPanel>
                                <TextBlock Text="⚠️ BANANAMOD HACK-CLIENT AKTIVIERT ⚠️" FontSize="16" FontWeight="Bold" Foreground="#ff4444" Margin="0,0,0,10"/>
                                <TextBlock Text="[✓] Fly (Taste: F)" Foreground="#ff4444" FontSize="14"/>
                                <TextBlock Text="[✓] Speed (Taste: V)" Foreground="#ff4444" FontSize="14"/>
                                <TextBlock Text="[✓] Killaura (Automatisch)" Foreground="#ff4444" FontSize="14"/>
                                <TextBlock Text="[✓] X-Ray (Taste: X)" Foreground="#ff4444" FontSize="14"/>
                            </StackPanel>
                        </Border>
                    </StackPanel>
                </Border>
            </StackPanel>
            
        </Grid>
    </Grid>
</Window>
