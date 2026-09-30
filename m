Received: from payinal.metztli.com (payinal.metztli.com [74.208.129.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6253B42C6
	for <reiserfs-devel@vger.kernel.org>; Wed, 30 Sep 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.129.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758823; cv=none; b=UaJYEjFw/DahPEPi+gN//yWZ8eIMKRwqMo5bjo6FWrnVIE5ec64KhIwaCWOR6cEH6BXUwaUN+69RIqwpRuRWM4gxng6Ld859MCaBQDiHuPdZAfdcdbaIlq8a8eG5qdIGfUgP+tXXe1D92cT2O0pazE4cEfHNzWCMfxF5qekkV8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758823; c=relaxed/simple;
	bh=qkBoav3IcC921MF6hw43M8MUDwRcP7jK7Q3T0BPuyYU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=C3kF6+fL7srXIhCvnxVyPgROCcFsMpfWreLpLPSzScYOiFx7JG4BfcVGs5yNt8KlDWmlmfoq5m9L6sexlNzz67fliuUoJJfDyNfYsYONBTRbxol+IQLTCJ6UuSXFenhVwAtye55ezXku+7VIIFb9JRp2It3I9s/YpxXlORtZmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com; spf=pass smtp.mailfrom=metztli.com; dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b=4IItHFAR; arc=none smtp.client-ip=74.208.129.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metztli.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b="4IItHFAR"
Received: from payinal.metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTP id 4hvpsd0L7HzVHJ6
	for <reiserfs-devel@vger.kernel.org>; Wed, 30 Sep 2026 02:00:21 -0700 (PDT)
Authentication-Results: payinal.metztli.com (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=metztli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=metztli.com; h=
	content-transfer-encoding:content-type:organization:message-id
	:user-agent:references:in-reply-to:subject:to:from:date
	:mime-version; s=dkim; t=1790758820; x=1793350821; bh=qkBoav3IcC
	921MF6hw43M8MUDwRcP7jK7Q3T0BPuyYU=; b=4IItHFAR62K1peyn0Ox5gISEye
	u869ut8EcmCji8OQJ2SVg6D7+gkpHxDlxoqMjrHOYM3ZeEsKvcfkrTCoSYSjaPmr
	JGMStynXPCLtyP9bi5qDZ2kyq+cGYih8Iik6yVl4o2ChivixDEVRNbsAh5Qt4uPn
	PE50yPcX8ybLd9MOL3QEwNTcaMHppcS1MqiAy2KUtDsy3fUkEApBiVwg/VzyDD2z
	yHp4t4TTbmVL2B6yEX77fYbBvxMsWkgC0InCKbyJQrgtXK/PsBOkNh0ntlzSAtDr
	nG2nO6Oy205bM9oi2L8+m8TkSTyZ1Vk+Toalw4QP+CwNtvJ1ueFJ/wuZgjIw==
X-Virus-Scanned: Debian amavis at payinal.metztli.com
Received: from payinal.metztli.com ([127.0.0.1])
 by payinal.metztli.com (payinal.metztli.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5_78zOrdco0d for <reiserfs-devel@vger.kernel.org>;
 Wed, 30 Sep 2026 02:00:20 -0700 (PDT)
Received: from metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTPSA id 4hvpsc31TTzVHHg;
	Wed, 30 Sep 2026 02:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 02:00:20 -0700
From: Jose R Rodriguez <jose.r.r@metztli.com>
To: Eduard Shishkin <edward.shishkin@gmail.com>
Cc: Debian kernel maintainers <debian-kernel@lists.debian.org>,
 reiserfs-devel@vger.kernel.org
Subject: Re: Debian Packaging for 5.15 LTS where to add extra header/common
 scripts/files
In-Reply-To: <7ef80c12-9a37-4eaf-a703-5542a25973a5@gmail.com>
References: <d23f0bbb44f29764a45d101231ecee8e@metztli.com>
 <cde8818f90f2119cc1b19da68247a564@metztli.com>
 <7ef80c12-9a37-4eaf-a703-5542a25973a5@gmail.com>
User-Agent: Roundcube Webmail
Message-ID: <1a3e47731b56ac7a73cf88b9ba02b510@metztli.com>
X-Sender: jose.r.r@metztli.com
Organization: Metztli IT
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-29 14:29, Eduard Shishkin wrote:
> On 9/28/26 16:32, Jose R Rodriguez wrote:
> 
>> On 2026-09-28 01:41, Jose R Rodriguez wrote:
>> 
>>> Niltze [Hello]
>>> 
>>> I have hacked an official 'Debian Packaging for 5.15.15-2 for
>>> backports' and wrapped it over an reiser4 -enhanced 5.15.220
> 
> Won't an overflow occur in the third register?

..and even if that were the case, Ed, the reiser4 for 5.16 patch we are 
still stuck with applies, with my own modifications and/or upstream 
commit revert(s), to 5.17.15 (last)! kernel 5.18 is a totally different 
beast which requires the reiser4 patch to substantively modify its code.

And thus the reasoning for the reiser4 5.15 LTS hack is to address the 
"Total Vulnerable CVE's in 5.17.15 : 7035" shortcomings "That's a 
non-trivial amount..." ;-)
< https://www.openwall.com/lists/oss-security/2026/07/30/21 >

> Has anyone even tried porting Reiser4/5 to newer kernels (5.17+)? As
> far as I remember, for this, one had to make a friendship with the
> newly introduced "folios"..
> 
> Thanks,
> Edward.
> 
>>> LTS. During the task I added to debian/patches directory support
>>> for upstream RTW89 WiFi 6 module(s) and 'drm/amd/display: Avoid
>>> flooding unnecessary info messages' modified patch based on:
>>> <
>>> 
>> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=290072065dffec1752f21c6bc7f7e5eca7aaf706
>>>> [1]
>>> 
>>> The build completes nicely and I am using the reiser4 5.15.220 LTS
>>> kernel, testing it during daily use:
>>> < https://metztli.it/lts > [2]
>>> 
>>> When it came time to build VirtualBox 7.2.20 during my testing,
>>> the
>>> /usr/src/linux-headers-*-common/scripts/
>>> package missed inclusion of
>>> pahole-version.sh
>>> pahole-flags.sh
>>> 
>>> which, of course, are part of and under 5.15.220/linux/scripts
>>> directory.
>>> 
>>> Question I have is, where in the Debian Packaging for x.y.z
>>> framework can I define the extra files missing from my current
>>> build?
>>> 
>>> Any hints would be appreciated very much!
>> 
>> Never mind, issue is solved by modifying
>> debian/rules.d/scripts/Makefile and specifying those missing files
>> in my Debian Packaging for 5.15.220 LTS patch, again, as just
>> elaborated at:
>> < https://metztli.it/lts > [2]
> 
> 
> 
> Links:
> ------
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=290072065dffec1752f21c6bc7f7e5eca7aaf706
> [2] https://metztli.it/lts

-- 
Best Professional Regards.

--
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Trixie w/ Linux 5.17.15-3 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
