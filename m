From: Kaelyn Uhrain <Kaelyn.Alexi+reiserfs@gmail.com>
Subject: Two questions about reiser4
Date: Wed, 26 Jan 2011 08:54:12 -0800
Message-ID: <AANLkTimzRZ2q01K0HkKGxjm0FZ_Fhiw+ozK6mJH9_DEO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
         :message-id:subject:from:to:content-type;
        bh=WT1oVSod8F4k0iSQKKQe8g7453lSgw+F8fmRDPDOLmA=;
        b=j6NnjDEX8PJSgvT4f6ji/iZ/l4dyUCVMbLmL6vIzIZvCRecR2VZnAjUrTJ/U7tpvpD
         UglS+WLeB8aoAvg9vNwd5g66xk+3WuI9xWUJ0LoIMKxEwTmC0yoZxzZzcd34KC5OOzIw
         nAI8JH5iEuV9i6+Rx85AjpzgCZaTCoYJoi/e4=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,

I have two questions concerning reiser4:

1) Does it have TRIM support for SSDs, and if not what would be
necessary to add support?

2) What is left to do for having reiser4 included in the mainline kernel?

Thank you in advance for your time, and kudos for continuing
development on a great filesystem.

Cheers,
Kaelyn
