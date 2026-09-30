Received: from payinal.metztli.com (payinal.metztli.com [74.208.129.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021F3CBE6E
	for <reiserfs-devel@vger.kernel.org>; Wed, 30 Sep 2026 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.129.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757403; cv=none; b=PTTTW2p0taw9C7IMUyo6E0Z8GdB3SanHbxp5MxWCH6ynOUR2Dg21y4NuCHhww88oF6o1qBBbZf1tOj1o5lSMuwcdVmiLFVNfmUO6lQR2teo0XXFw9veeBGZfFnDEtow/88r0puV1UdEh1JITI+LCPO+6S0Jb1oItESn6AjhTs88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757403; c=relaxed/simple;
	bh=2FEDsNOLeOBjR1ANScuVzNVnmzXhAlUwvysbMecUIBs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=PXHFCGJIJVrF10IOgedlb5LMmWI/7uMtqVs+DTJ4tAwnomHS2LXskITpKAzpetxGupTFm/yzA2WMVD+kOSn10+E7n/f55DpSBuw8mUTvlyPhXJmCGETLUInpSk6BDwrYmTot921wM8ATfxRH0RDnlngCoIXBuBRWSh9paTkLFX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com; spf=pass smtp.mailfrom=metztli.com; dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b=wC90EBn2; arc=none smtp.client-ip=74.208.129.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metztli.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b="wC90EBn2"
Received: from payinal.metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTP id 4hvpC90DHyzVHC9
	for <reiserfs-devel@vger.kernel.org>; Wed, 30 Sep 2026 01:30:29 -0700 (PDT)
Authentication-Results: payinal.metztli.com (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=metztli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=metztli.com; h=
	content-transfer-encoding:content-type:organization:message-id
	:user-agent:references:in-reply-to:subject:to:from:date
	:mime-version; s=dkim; t=1790757028; x=1793349029; bh=2FEDsNOLeO
	BjR1ANScuVzNVnmzXhAlUwvysbMecUIBs=; b=wC90EBn26FbhnaA48Xnubxac7E
	XSH5vopr6ugaCINHjXFB3/Y7kylw12bOaIjF8/Rfa3wqhtCR9E/5SEJBmq1i4GQb
	vUQAtC3283hKBy/6YIXaO8TZaDuXNj/Wcs1YmrLXvbJLI9gxsAeF23q5Cb7lAJ9+
	FiE6XmPteG9KGrpbPddu8V78l3S6pp/Fei7xSnmwQfKmbfvt2HZsFcgxwUvJlpFQ
	XAElt14R0v+jmpGldd7e88PM7L5daX0PuPJcVm/fHrWBwe83ACmKMpdxcTV11h8E
	rFhpBkTq/iySLzvrnurw85u+M3oRHhfOsf8i4q4Pi6eDXtRTS8oVR2PvM4Gg==
X-Virus-Scanned: Debian amavis at payinal.metztli.com
Received: from payinal.metztli.com ([127.0.0.1])
 by payinal.metztli.com (payinal.metztli.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id GdJLaVTgIzQP for <reiserfs-devel@vger.kernel.org>;
 Wed, 30 Sep 2026 01:30:28 -0700 (PDT)
Received: from metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTPSA id 4hvpC83qp9zVHBn;
	Wed, 30 Sep 2026 01:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 01:30:28 -0700
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
Message-ID: <fb5b5c1eb3637f89c626419a4f27bca1@metztli.com>
X-Sender: jose.r.r@metztli.com
Organization: Metztli IT
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Glad to hear you are still around, Ed!

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
That's why I tagged you, Sr., you are the expert ;-) Notwithstanding, 
approximately one week + of daily use / testing development has not 
introduced anomalies, except for the dmesg flooding and missing 
pahole-*.sh files; issues which have been resolved with integrated 
patches into the Debian Packaging for 5.5.220 framework.

> Has anyone even tried porting Reiser4/5 to newer kernels (5.17+)? As
> far as I remember, for this, one had to make a friendship with the
> newly introduced "folios"..
5.15 LTS has not introduced 'folios', yet, as far as I analyzed the 
commits.

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
