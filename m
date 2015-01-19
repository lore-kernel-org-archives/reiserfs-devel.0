From: dimas <dimas000@ya.ru>
Subject: Re: Why patch reiser4-for-3.17.3.patch does not apply ?
Date: Mon, 19 Jan 2015 17:49:31 +0300
Message-ID: <20150119174931.68bac05a@Ulf.tvoe.tv>
References: <9cc275035b16b88c3bd4ada2aa9786f0@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1421678972;
	bh=uUcr/R1Gys3ej7e1v7mTpKIrRFEeq4b4e5xpxIh2PiI=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=YJa9AXLvo2VBNSW+K6SfaBfSAiLn+Kxj6WRJxrJm5+otqcU+iufEB+7RnqnomNegH
	 yqb7OncpUW8mu3QROa16kACow9H04ekZmLHYVhfGMjGMI9fKW4wexm+jkzWN5QzaMQ
	 ou7NnEMVVDNsn7wYBWSnR6/6lGNEmzbvjh0XIWtE=
In-Reply-To: <9cc275035b16b88c3bd4ada2aa9786f0@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

why are you trying to apply 3.17.3 patch to the older kernel?


2015-019 17:52 doiggl@velocitynet.com.au <doiggl@velocitynet.com.au> wrote:
> Hello,
> The reiser4-for-3.17.3.patch fails against linux-3.17.tar
