
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SeniorProject.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Home </title>

    <style>
        /* GLOBAL */
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #fff9fb;
            color: #34242f;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        a {
            text-decoration: none;
        }

        /* NAVIGATION */
        .top-menu {
            min-height: 82px;
            padding: 0 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            background: white;
            border-bottom: 1px solid #f3c6d3;
        }

        .home-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #34242f;
            font-size: 23px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 13px;
            background: #d46a92;
            color: white;
            font-size: 25px;
        }

        .logo-stem {
            color: #b565a7;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-link {
            color: #776975;
            font-size: 14px;
            font-weight: 600;
            transition: color 0.2s;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #d46a92;
        }

        .account-link {
            padding: 11px 16px;
            border-radius: 25px;
            background: #f3c6d3;
            color: #9c456c;
        }

        .top-line {
            display: none;
        }

        /* PAGE LAYOUT */
        .home-container {
            width: 86%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* WELCOME SECTION */
        .welcome-section {
            min-height: 400px;
            margin-top: 40px;
            padding: 45px 50px;
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            align-items: center;
            gap: 25px;
            overflow: hidden;
            border-radius: 25px;
            background: linear-gradient(
                115deg,
                #fbe3eb,
                #f7dce7 55%,
                #f3c6d3
            );
        }

        .welcome-text {
            position: relative;
            z-index: 1;
        }

        .welcome-label,
        .section-label {
            color: #b565a7;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 2px;
        }

        .welcome-section h1 {
            margin: 18px 0;
            color: #34242f;
            font-size: clamp(34px, 4vw, 48px);
            line-height: 1.2;
            letter-spacing: -1.5px;
        }

        .welcome-section h1 span {
            color: #d46a92;
        }

        .welcome-description {
            max-width: 450px;
            margin-bottom: 25px;
            color: #776674;
            font-size: 15px;
            line-height: 1.8;
        }

        .primary-button {
            display: inline-flex;
            align-items: center;
            gap: 22px;
            padding: 14px 21px;
            border-radius: 11px;
            background: #d46a92;
            color: white;
            font-size: 14px;
            font-weight: 700;
            box-shadow: 0 7px 18px #d46a9226;
            transition: background 0.2s, transform 0.2s;
        }

        .primary-button:hover {
            background: #b565a7;
            transform: translateY(-2px);
        }

        .button-arrow {
            font-size: 20px;
        }

        .welcome-note {
            margin-top: 22px;
            color: #8e7284;
            font-size: 12px;
        }

        .welcome-note span {
            margin-right: 5px;
            color: #d46a92;
            font-size: 17px;
        }

        /* ART CARD */
        .welcome-art {
            position: relative;
            min-height: 290px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .art-circle {
            position: absolute;
            border-radius: 50%;
        }

        .circle-one {
            width: 270px;
            height: 270px;
            background: #ffffff70;
        }

        .circle-two {
            width: 210px;
            height: 210px;
            border: 1px solid #d46a9240;
        }

        .art-card {
            position: relative;
            z-index: 1;
            width: 265px;
            min-height: 235px;
            padding: 25px;
            border: 1px solid #ffffff;
            border-radius: 21px;
            background: #ffffffee;
            box-shadow: 0 18px 50px #d46a9220;
            transform: rotate(-3deg);
        }

        .art-sparkle {
            position: absolute;
            top: 15px;
            right: 19px;
            color: #b565a7;
            font-size: 25px;
        }

        .art-heart {
            margin-bottom: 9px;
            color: #d46a92;
            font-size: 38px;
        }

        .art-card h2 {
            margin: 4px 0;
            font-size: 23px;
            letter-spacing: -0.5px;
        }

        .art-card p {
            color: #8b7585;
            font-size: 12px;
            line-height: 1.7;
        }

        .art-bottom {
            display: flex;
            justify-content: space-between;
            margin-top: 19px;
            padding-top: 12px;
            border-top: 1px solid #f3c6d3;
            color: #d46a92;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        /* DECORATIONS */
        .floating-decoration {
            position: absolute;
            z-index: 2;
            color: #d46a92;
            font-size: 30px;
        }

        .decoration-one {
            top: 25px;
            right: 8%;
        }

        .decoration-two {
            bottom: 25px;
            left: 8%;
            color: #b565a7;
        }

        .decoration-three {
            top: 45px;
            left: 10%;
            color: #d46a92;
            font-size: 21px;
        }

        /* FEATURE SECTION */
        .home-section {
            padding-top: 45px;
        }

        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 23px;
        }

        .section-heading h2 {
            margin: 9px 0 7px;
            font-size: 27px;
            letter-spacing: -0.7px;
        }

        .section-heading p {
            margin: 0;
            color: #776674;
            font-size: 13px;
            line-height: 1.7;
        }

        .heading-heart {
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #f3c6d3;
            color: #d46a92;
            font-size: 26px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 0.9fr;
            gap: 19px;
        }

        /* FEATURE CARDS */
        .feature-card {
            min-height: 260px;
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            border: 1px solid #f3c6d3;
            border-radius: 19px;
            background: white;
            box-shadow: 0 5px 20px #d46a9208;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        a.feature-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px #d46a9218;
        }

        .feature-icon {
            width: 46px;
            height: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            font-size: 24px;
        }

        .feature-icon.pink-icon {
            background: #f3c6d3;
            color: #d46a92;
        }

        .feature-icon.lavender-icon {
            background: #f7e6f3;
            color: #b565a7;
        }

        .feature-tag {
            margin-top: 20px;
            color: #b565a7;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: 1.5px;
        }

        .feature-card h3 {
            margin: 9px 0;
            color: #34242f;
            font-size: 20px;
        }

        .feature-card > p {
            margin: 0 0 20px;
            color: #776674;
            font-size: 12px;
            line-height: 1.8;
        }

        .feature-link {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-top: auto;
            color: #d46a92;
            font-size: 12px;
            font-weight: 700;
        }

        .feature-link span {
            font-size: 17px;
        }

        /* QUOTE CARD */
        .quote-card {
            position: relative;
            min-height: 260px;
            padding: 25px;
            overflow: hidden;
            border-radius: 19px;
            background: #f7e6f3;
        }

        .quote-mark {
            color: #b565a7;
            font-family: Georgia, serif;
            font-size: 49px;
            line-height: 1;
        }

        .quote-card p {
            position: relative;
            z-index: 1;
            margin: 8px 0 23px;
            color: #594463;
            font-size: 17px;
            font-weight: 600;
            line-height: 1.7;
        }

        .quote-footer {
            position: relative;
            z-index: 1;
            color: #b565a7;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        .quote-decoration {
            position: absolute;
            right: -8px;
            bottom: -27px;
            color: #b565a72b;
            font-size: 110px;
        }

        /* FOOTER */
        .home-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-top: 50px;
            padding: 23px 0;
            border-top: 1px solid #f3c6d3;
            color: #9a8995;
            font-size: 11px;
        }

        .footer-logo {
            color: #34242f;
            font-size: 15px;
            font-weight: 800;
        }

        .footer-logo span {
            color: #d46a92;
        }

        /* TABLET */
        @media (max-width: 900px) {
            .home-container {
                width: 90%;
            }

            .top-menu {
                padding: 18px 5%;
            }

            .nav-links {
                gap: 15px;
            }

            .welcome-section {
                padding: 35px;
                grid-template-columns: 1fr 0.8fr;
            }

            .feature-grid {
                grid-template-columns: 1fr 1fr;
            }

            .quote-card {
                grid-column: 1 / -1;
                min-height: 210px;
            }
        }

        /* MOBILE */
        @media (max-width: 600px) {
            .top-menu {
                align-items: flex-start;
                flex-direction: column;
                gap: 17px;
            }

            .nav-links {
                width: 100%;
                flex-wrap: wrap;
                gap: 14px;
            }

            .nav-link {
                font-size: 12px;
            }

            .account-link {
                padding: 8px 10px;
            }

            .home-container {
                width: 90%;
            }

            .welcome-section {
                margin-top: 22px;
                padding: 28px 22px;
                grid-template-columns: 1fr;
            }

            .welcome-section h1 {
                font-size: 36px;
            }

            .welcome-art {
                min-height: 280px;
            }

            .home-section {
                padding-top: 35px;
            }

            .section-heading h2 {
                font-size: 23px;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

            .quote-card {
                grid-column: auto;
            }

            .home-footer {
                align-items: flex-start;
                flex-direction: column;
                margin-top: 35px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <header class="top-menu">
            <a href="HomePage.aspx" class="home-logo">
            </a>

            <nav class="nav-links">
                <a href="HomePage.aspx" class="nav-link active">Home</a>
                <a href="Channels.aspx" class="nav-link">Channels</a>
                <a href="AccountSettings.aspx" class="nav-link">Settings</a>

                <asp:HyperLink ID="UserGreeting" runat="server"
                    NavigateUrl="AccountSettings.aspx"
                    CssClass="nav-link account-link">My Account</asp:HyperLink>
            </nav>
        </header>

        <main class="home-container">

            <section class="welcome-section">
                <div class="welcome-text">
                    <span class="welcome-label">
                        YOUR SPACE. YOUR PEOPLE. YOUR FUTURE.
                    </span>

                    <h1>
                        Hey, <asp:Label ID="lblWelcomeName" runat="server"
                            Text="girl" />!
                        <br />
                        <span>Welcome to your space.</span>
                    </h1>

                    <p class="welcome-description">
                        A place to connect, share ideas, talk about what
                        matters, and grow together. There's a seat for you here.
                    </p>

                    <a href="Channels.aspx" class="primary-button">
                        Explore Channels <span class="button-arrow">→</span>
                    </a>

                    <div class="welcome-note">
                        <span>♡</span> Come as you are. Find your people.
                    </div>
                </div>

                <div class="welcome-art">
                    <div class="art-circle circle-one"></div>
                    <div class="art-circle circle-two"></div>

                    <div class="art-card">
                        <span class="art-sparkle">✳</span>
                        <div class="art-heart">♡</div>
                        <h2>Big ideas.</h2>
                        <h2>Real connections.</h2>
                        <p>There's room for you to grow here.</p>

                    </div>

                    <span class="floating-decoration decoration-one">♡</span>
                    <span class="floating-decoration decoration-two">✳</span>
                    <span class="floating-decoration decoration-three">✦</span>
                </div>
            </section>

            <section class="home-section">
                <div class="section-heading">
                    <div>
                        <span class="section-label">YOUR COMMUNITY</span>
                        <h2>Where do you want to go?</h2>
                        <p>Pick up where you left off or explore something new.</p>
                    </div>

                    <span class="heading-heart">♡</span>
                </div>

                <div class="feature-grid">

                    <a href="Channels.aspx" class="feature-card">
                        <div class="feature-icon pink-icon">✳</div>
                        <span class="feature-tag">CONNECT &amp; SHARE</span>
                        <h3>Explore Channels</h3>
                        <p>
                            Find conversations, share your thoughts, and
                            connect with your community.
                        </p>
                        <span class="feature-link">
                            Find your people <span>→</span>
                        </span>
                    </a>

                    <a href="AccountSettings.aspx" class="feature-card">
                        <div class="feature-icon lavender-icon">♡</div>
                        <span class="feature-tag">MAKE IT YOURS</span>
                        <h3>Your Account</h3>
                        <p>
                            Update your profile and keep your account
                            details the way you like them.
                        </p>
                        <span class="feature-link">
                            View your settings <span>→</span>
                        </span>
                    </a>

                    <div class="quote-card">
                        <span class="quote-mark">“</span>
                        <p>
                            Your ideas matter. Your voice matters.
                            You belong in every room you walk into.
                        </p>
                        <span class="quote-footer">
                            A LITTLE REMINDER FOR YOU ♡
                        </span>
                        <div class="quote-decoration">✿</div>
                    </div>

                </div>
            </section>

            <footer class="home-footer">
                <a href="HomePage.aspx" class="footer-logo">
                </a>
                <span>Made for connection, creativity &amp; community ♡</span>
            </footer>

        </main>
    </form>
</body>
</html>
