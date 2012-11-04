From: dimas <dimas000@ya.ru>
Subject: current status of r4's ccreg40
Date: Sun, 4 Nov 2012 17:08:33 +0400
Message-ID: <20121104170833.5257bb72@Ulf.tvoe.tv>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1352034514;
	bh=d07pRAXTp4SHJ3flTCPsT3W3UAje53bPJFsH/PVGmzA=;
	h=Date:From:To:Subject:Message-ID:Reply-To:X-Mailer:Mime-Version:
	 Content-Type:Content-Transfer-Encoding;
	b=Bsa6LBcMPfSEo3T3BX4IOQ8PoFuROz2FgA2O4famsGiWXNcAuvU3iWgHUFgOsei0O
	 yuPm8Cf3QNVPRqsY2BYtm/LbopGB2Z4niLCXI4HfvcC1jU9kPniDCGxhaB77HXnoIT
	 w/ZJYPxg1zRVqAa5BOMhxKiXMYagxJS79bbZuTJM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

hello, Edward!
in "reiser4-for-3.6" you've announced some fixes for cryptocompress plugin. for those who don't understand what that's all about, can you please explain, should ccreg40 now behave more stable, or it's still "not recommended"?
btw, what are sane formatting parameters now, after recent 3.6.4 fixups? still reg40 and formatting=extents?
