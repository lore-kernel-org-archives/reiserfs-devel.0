From: dimas <dimas000@ya.ru>
Subject: Re: Anyone know to fix "Exiting after unrecoverable error." using
 mkfs -t reiserfs /dev/sdbX
Date: Sat, 15 Jul 2017 14:12:02 +0300
Message-ID: <20170715141202.459fa1ee@Ulf.tvoe.tv>
References: <7e71024c79157640844bd4a628256909@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1500117124;
        bh=We/qKrLWw9wIk6hlw55/RC4mbud45DrA5vRBC0r2drI=;
        h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To;
        b=YN9Fh/Q0jzxgS660FUy8LIVb1c/gvRCheF2yF4BOL0/cfybditFEpMR8M88Z9E1Nq
         44K9G8McQR+HPe1a2KlLLuG8t6Mg3pEdio/dGvIN1Rea1FGCZPaOYaL5wiDbRsESvu
         lmX8ikaLiSgI9I9lKrfyEjdnyos09XxHRJGP5ass=
In-Reply-To: <7e71024c79157640844bd4a628256909@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

did you try to zero-wipe the partition?
