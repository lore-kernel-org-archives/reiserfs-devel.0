From: dimas <dimas000@ya.ru>
Subject: Re: Reiser4: discard support with delayed issuing of discard
 requests
Date: Sun, 10 Aug 2014 19:02:10 +0400
Message-ID: <20140810190210.033a96da@Ulf.tvoe.tv>
References: <53E6A7F1.6030006@gmail.com>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1407682931;
	bh=4BnzPuUGzmYQ5yUk09P7LqKvJ2l4ttvCIpzgpn4zk78=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=YmhSyvt8YiWjsPIT3g4BqT2HvmdCx20BVwLgT+JQ/o7hl+Ro9ShxUNJ/vM0r8YKlS
	 2J2htVxNKnoMAHpZ4HzsYSEcwT37154L8EYUs81prFuvze71UYw8AbL+H6XKBuTpHh
	 RFRQPZs7PbAQYxC1Y/hJwS+7HZzMnQuvJ7weO0EI=
In-Reply-To: <53E6A7F1.6030006@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

thanks a lot for your explanations!
does it all make any sense for non-ssd?
will 3.16 contain this all-in-one, without extra patches to find somewhere else?
