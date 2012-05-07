From: dimas <dimas000@ya.ru>
Subject: Re: Help please
Date: Mon, 7 May 2012 20:12:08 +0400
Message-ID: <20120507201208.5eec936a@Ulf.tvoe.tv>
References: <CANish_k+TucLHQQCkx5kHaqN6e7kJOFqKG4fsey18BhWBs=BWA@mail.gmail.com>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1336407129; bh=ABKxXQFeLNFHARrXpCedvVfkp+Enm/RVG/Jufli+MOg=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=Ifo4ZqvcjCdkRhUVhTHpiPq7duVMTlhiGfK6dxizQDJqkCwPd6YYo07bM+hpK71t7
	 iNG3tPoFoOabbPX/H0ycTO0fbiHHyy3j/XBQ5cZ5cEiGAHTwv6FQTtGz/579tV4eBn
	 0DeO5TIJwKIdocYEA3yBt3+4Sh1S70laXdim5FaA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1336407128;
	bh=ABKxXQFeLNFHARrXpCedvVfkp+Enm/RVG/Jufli+MOg=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=W3pyUY6grCNqcdfL7tk5vRgtj+R00jmjghpsylQA3xF7lb1VGuQr6CujTfAvFCNul
	 uPixnV8mJ8FlcXpLlE8ceULZD8tjgE47BtI1q/+sS/r68fpnbEaTotx9l4z/qj537D
	 Gz9NBmRJSJQdcuCuNR5L8dm73/AYsL1Vyay7W2YQ=
In-Reply-To: <CANish_k+TucLHQQCkx5kHaqN6e7kJOFqKG4fsey18BhWBs=BWA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sandro Souza <escovadordebits@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

> I made 3 videos (by XVidCap without sound) with these tests.
> They're available in http://www.smartsolutionfactory.com.br/reiser4
screencasts? for what reason?

> After reboot the VM, no problem. But after it, I've tried to copy a
> folder from a reiser3 partition to a reiser4 partition, and
> unfortunally it has failed. :(
> I need to know what I'm doing wrong.
simply show output of smth like "cp -av /mnt/reiser3/folder /mnt/reiser4"
and maybe following dmesg/syslog messages, if copying triggers some oops/warning
