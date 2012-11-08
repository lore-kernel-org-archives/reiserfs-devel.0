From: dimas <dimas000@ya.ru>
Subject: Re: insserv on Debian triggers "kernel BUG at
 fs/reiser4/plugin/object.c:58"
Date: Thu, 8 Nov 2012 18:48:58 +0400
Message-ID: <20121108184858.7ef43629@Ulf.tvoe.tv>
References: <20121107194935.4e27acea@Ulf.tvoe.tv>
	<509AC8D2.9070500@gmail.com>
	<20121108184411.450146fb@Ulf.tvoe.tv>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1352386139;
	bh=Mdd/gNMgFbagjhIYjbCPswkCB5o1SgBFhXIaJ1+oiqs=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=CFqJ3APsfE8JZHd+5LUXS1YP9kLV47DvSYuCqYxuv0NMwDDJcCHbGEMOg/fCO7lA/
	 Kry95SniTriieTPIQAg2niZ2ur2+nMjdfG6sbPi0a142sbWJeO2AcsdieVm/bw6n4Q
	 1hMglnVs12TJGxrWl9l8YxGWhBN8vXSMPS1eyWtM=
In-Reply-To: <20121108184411.450146fb@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

btw, with this patch insserv made its job succesfully. yesterday on update it failed due to that oops.
and one more idea: insserv deals a lot with symlinks. maybe that's why it triggers the oops rather than other software...
