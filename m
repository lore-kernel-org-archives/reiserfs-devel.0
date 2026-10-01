Received: from payinal.metztli.com (payinal.metztli.com [74.208.129.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079EB36BCD7
	for <reiserfs-devel@vger.kernel.org>; Thu,  1 Oct 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.129.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849086; cv=none; b=NNBHhG32z3JAFx5hAZ7AO+/Wa9XiTRT9uEKDzDKqZz9xciwnkFFcq3RG0EcVmSLpREnB+fuzfuY8IiLuWegpq1lBXo5ovhz3566IOE0gOnJPPx+kL+4MJGIbzfkmzGtfK1eAx+diNPhye9rKfi4Zul02fAJbMNuI9wjzD/g2iXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849086; c=relaxed/simple;
	bh=HuVeMaybPnWP9UECVyq3VvioAQKaUM3nGhfvwkIOqEk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lJHd7QwdBWjsP3r8daWjB2AWWGbm7ROoOjZN43Y6rYQ8goqAi4jdC4fKbGapSeZCzFoaUnRoz034t3HY1CiWicCTpBEegsgdRDRbjLE/OoEYi9QcO2j+rqXDOmSv0UPLCXkDJy9z9ZKBHFrQ8X/d6xnp6ttpT/LZnN6W+zdyZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com; spf=pass smtp.mailfrom=metztli.com; dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b=BWsd5RsG; arc=none smtp.client-ip=74.208.129.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metztli.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b="BWsd5RsG"
Received: from payinal.metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTP id 4hwSFL3mn0zVKt7
	for <reiserfs-devel@vger.kernel.org>; Thu, 01 Oct 2026 03:04:38 -0700 (PDT)
Authentication-Results: payinal.metztli.com (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=metztli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=metztli.com; h=
	content-transfer-encoding:content-type:organization:message-id
	:user-agent:references:in-reply-to:subject:to:from:date
	:mime-version; s=dkim; t=1790849078; x=1793441079; bh=HuVeMaybPn
	WP9UECVyq3VvioAQKaUM3nGhfvwkIOqEk=; b=BWsd5RsG/gm7m28Jctf0Y8BMXo
	AvTj/B+T8ZeoCipOdfJBbDUZ0y3rg9RNckHtOyw5l2eScjWtsAEw9DWbWPohQlGo
	/7QUNWbOSvJen3bOKEAnYl+mGS47KBVcPTL4Ywf7PKlkOw32C+hKGpMkGPynGr9f
	+aKPhYVyEI1cBNSPTtCNJok86YEJWNTcywnr+Y3ken1qnfcaYwE2x0YAjXuJL/Gh
	/QaVp0sEqDeg4QZfm5BqEOQLyc4ntzhVIYCV8KAkHbEvWOVJMAQ/nX/utIbFA08f
	fbPt+B4jarc7P1Wi2YPosUC5z/6ZiE6cjk9f9UOmuQ1bqbOqhGpK9vpRu2CA==
X-Virus-Scanned: Debian amavis at payinal.metztli.com
Received: from payinal.metztli.com ([127.0.0.1])
 by payinal.metztli.com (payinal.metztli.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id I9Mr7uoXBe64 for <reiserfs-devel@vger.kernel.org>;
 Thu,  1 Oct 2026 03:04:38 -0700 (PDT)
Received: from metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTPSA id 4hwSFL0B8qzVKsh;
	Thu, 01 Oct 2026 03:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 03:04:37 -0700
From: Jose R Rodriguez <jose.r.r@metztli.com>
To: Eduard Shishkin <edward.shishkin@gmail.com>
Cc: Debian kernel maintainers <debian-kernel@lists.debian.org>,
 reiserfs-devel@vger.kernel.org
Subject: Re: Debian Packaging for 5.15 LTS where to add extra header/common
 scripts/files
In-Reply-To: <fb5b5c1eb3637f89c626419a4f27bca1@metztli.com>
References: <d23f0bbb44f29764a45d101231ecee8e@metztli.com>
 <cde8818f90f2119cc1b19da68247a564@metztli.com>
 <7ef80c12-9a37-4eaf-a703-5542a25973a5@gmail.com>
 <fb5b5c1eb3637f89c626419a4f27bca1@metztli.com>
User-Agent: Roundcube Webmail
Message-ID: <8fe0a5f1b5291c9056ad7eba877ba5a6@metztli.com>
X-Sender: jose.r.r@metztli.com
Organization: Metztli IT
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-30 01:30, Jose R Rodriguez wrote:
> Glad to hear you are still around, Ed!
> 
> On 2026-09-29 14:29, Eduard Shishkin wrote:
>> On 9/28/26 16:32, Jose R Rodriguez wrote:
>> 
>>> On 2026-09-28 01:41, Jose R Rodriguez wrote:
>>> 
>>>> Niltze [Hello]
>>>> 
>>>> I have hacked an official 'Debian Packaging for 5.15.15-2 for
>>>> backports' and wrapped it over an reiser4 -enhanced 5.15.220
>> 
>> Won't an overflow occur in the third register?
> That's why I tagged you, Sr., you are the expert ;-) Notwithstanding, 
> approximately one week + of daily use / testing development has not 
> introduced anomalies, except for the dmesg flooding and missing 
> pahole-*.sh files; issues which have been resolved with integrated 
> patches into the Debian Packaging for 5.5.220 framework.
> 
>> Has anyone even tried porting Reiser4/5 to newer kernels (5.17+)? As
>> far as I remember, for this, one had to make a friendship with the
>> newly introduced "folios"..
> 5.15 LTS has not introduced 'folios', yet, as far as I analyzed the 
> commits.
Apropos, looking at my annotations from a while back, as I was 
creating/modifying my hack of reiser4 for 5.15 LTS patch, I noticed that 
your reiser4 for 5.16 patch does not apply cleanly to 5.15 *because* 
'memory folios' were introduced with commit 
49f8275c7d9247cf1dd4440fc8162f784252c849 during the transition from 5.15 
to 5.16, Ed, i.e., 'memory folios' were present *already* in 5.16.

> 
>> 
>> Thanks,
>> Edward.
>> 
>>>> LTS. During the task I added to debian/patches directory support
>>>> for upstream RTW89 WiFi 6 module(s) and 'drm/amd/display: Avoid
>>>> flooding unnecessary info messages' modified patch based on:
>>>> <
>>>> 
>>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=290072065dffec1752f21c6bc7f7e5eca7aaf706
>>>>> [1]
>>>> 
>>>> The build completes nicely and I am using the reiser4 5.15.220 LTS
>>>> kernel, testing it during daily use:
>>>> < https://metztli.it/lts > [2]
>>>> 
>>>> When it came time to build VirtualBox 7.2.20 during my testing,
>>>> the
>>>> /usr/src/linux-headers-*-common/scripts/
>>>> package missed inclusion of
>>>> pahole-version.sh
>>>> pahole-flags.sh
>>>> 
>>>> which, of course, are part of and under 5.15.220/linux/scripts
>>>> directory.
>>>> 
>>>> Question I have is, where in the Debian Packaging for x.y.z
>>>> framework can I define the extra files missing from my current
>>>> build?
>>>> 
>>>> Any hints would be appreciated very much!
>>> 
>>> Never mind, issue is solved by modifying
>>> debian/rules.d/scripts/Makefile and specifying those missing files
>>> in my Debian Packaging for 5.15.220 LTS patch, again, as just
>>> elaborated at:
>>> < https://metztli.it/lts > [2]
>> 
>> 
>> 
>> Links:
>> ------
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=290072065dffec1752f21c6bc7f7e5eca7aaf706
>> [2] https://metztli.it/lts

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
