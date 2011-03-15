From: Eddie Chapman <eddie@ehuk.net>
Subject: Re: Reiser4 Oops on vanilla 2.6.37.2
Date: Tue, 15 Mar 2011 19:57:30 +0000
Message-ID: <4D7FC4AA.3060703@ehuk.net>
References: <deafa2accc4aa586b6b57e8d9a0fb086.squirrel@ssl.freestuffjunction.co.uk> <4D72BBD0.70907@gmail.com> <4D72C28A.20705@vger.kernel.org> <4D77F908.6080206@gmail.com>
Reply-To: Eddie Chapman <eddie@ehuk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=freestuffjunction.co.uk; s=default; t=1300219051;
	bh=ZjpjzqTxXHXhILLaJ4F894Owxc6ibhS/CcUf6NhyYKk=;
	h=Message-ID:Date:From:Reply-To:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=OrKqvcgBE1xQi/+wNnoNQkyGEGfBjZVykYKHDTQmegOdT1HVg1r/7fmueX2RqXzBa
	 Ey2xUNNir/1vmMyalcNOJaLg8gcD38Dbta/ABPnf3Xc6O3hwOObNur1p1PCZ6xwIxm
	 hunasB1euqYNiVX+axsA1zeMIo3IkeqEuyatp7v4=
In-Reply-To: <4D77F908.6080206@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

On 09/03/11 22:02, Edward Shishkin wrote:
>> Eddie
>
> Sorry, I've encountered strange deadlocks with this patch.
> Please, roll it back and use the attached one as the temporal
> workaround.
>
> Thanks,
> Edward.

Hi Edward,

Just a quick update to let you know the box is still up after 4 days 
after rebooting with vanilla 2.6.37.3 and your latest patch applied.

regards,
Eddie
