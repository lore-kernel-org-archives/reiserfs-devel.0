Received: from payinal.metztli.com (payinal.metztli.com [74.208.129.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A853ED02
	for <reiserfs-devel@vger.kernel.org>; Thu, 15 Oct 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.129.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077813; cv=none; b=jUD197orGhH8fe6xnJ4ZNHclE4OrBiK2OkSIYkFR/OpnRHvxpWvMz6rpGxEqqjqRtVPhw2+2EFueaPFurU4jAn7Y0qoek/TvnVrU/5UI5yfpAiAJLQsBUAGvCzqAO1Ikw0m//wJ0NvpWtY4nPs6qMdGYgLLQOF5ZcFaGlHhYHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077813; c=relaxed/simple;
	bh=VySTd29MkqX4tRrQSzhx7oSxT1erO5gsUlMCTIFtAv0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=IDv2+Sk0fS9LPOWzQH1/LOw0I80IY2zd55lEHd2VQVNZvdhDLAxOQsY/kFDoQ/w9JgsMp6ljyo3gmf71ndSXPumSWXTg532OWerosTg3k2uomdVpxbxLHt/cNOYfZDUqnXZJdsmD5aRSFT3mPFLf8b0F3HJb+evY9tpLafq8Kuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com; spf=pass smtp.mailfrom=metztli.com; dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b=T7By2nEo; arc=none smtp.client-ip=74.208.129.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metztli.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b="T7By2nEo"
Received: from payinal.metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTP id 4j5BVK1m75zW1rV
	for <reiserfs-devel@vger.kernel.org>; Thu, 15 Oct 2026 08:16:09 -0700 (PDT)
Authentication-Results: payinal.metztli.com (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=metztli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=metztli.com; h=
	content-transfer-encoding:content-type:organization:message-id
	:user-agent:references:in-reply-to:subject:to:from:date
	:mime-version; s=dkim; t=1792077369; x=1794669370; bh=VySTd29Mkq
	X4tRrQSzhx7oSxT1erO5gsUlMCTIFtAv0=; b=T7By2nEolxYsoQ41cI1TmxW25E
	c8zq/raRW8EeCSk5p6+D7FJU8mz4Di0CROFtLe5gSi9nhO20ZnD986ScMYclEU9D
	tAmR/1CGUMaSNvcQyNn8Gk+2okRcqBRA1WzsA30z17LeppkKgOOGl5gs5rEGOKCA
	sBGkT0AnHGBf4l9atx58Nf4v1YF/Z8rJKdKUFbByNIkEa5CGby3akus3OoJPcdve
	dpaWxn514qWaVLnuCq2/req3fXslgyay69HaQFjWSWjqwO8O5kYWl9XAYFrsNpv1
	8xw3Mu+UT7gQSSzFt0hi5jxwoTteE6mmzVCczjieERwHzGCfCEEpuRhzrtlA==
X-Virus-Scanned: Debian amavis at payinal.metztli.com
Received: from payinal.metztli.com ([127.0.0.1])
 by payinal.metztli.com (payinal.metztli.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id FO2RKYDyYUyG for <reiserfs-devel@vger.kernel.org>;
 Thu, 15 Oct 2026 08:16:09 -0700 (PDT)
Received: from metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTPSA id 4j5BVJ5hlZzW1r8;
	Thu, 15 Oct 2026 08:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 08:16:08 -0700
From: Jose R Rodriguez <jose.r.r@metztli.com>
To: Eduard Shishkin <edward.shishkin@gmail.com>
Cc: Debian kernel maintainers <debian-kernel@lists.debian.org>,
 reiserfs-devel@vger.kernel.org
Subject: Re: Debian Packaging for 5.15 LTS where to add extra header/common
 scripts/files
In-Reply-To: <8fe0a5f1b5291c9056ad7eba877ba5a6@metztli.com>
References: <d23f0bbb44f29764a45d101231ecee8e@metztli.com>
 <cde8818f90f2119cc1b19da68247a564@metztli.com>
 <7ef80c12-9a37-4eaf-a703-5542a25973a5@gmail.com>
 <fb5b5c1eb3637f89c626419a4f27bca1@metztli.com>
 <8fe0a5f1b5291c9056ad7eba877ba5a6@metztli.com>
User-Agent: Roundcube Webmail
Message-ID: <84ef3672c4429d79c1ebf38f51555706@metztli.com>
X-Sender: jose.r.r@metztli.com
Organization: Metztli IT
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-01 03:04, Jose R Rodriguez wrote:
> On 2026-09-30 01:30, Jose R Rodriguez wrote:
>> Glad to hear you are still around, Ed!
>> 
>> On 2026-09-29 14:29, Eduard Shishkin wrote:
>>> On 9/28/26 16:32, Jose R Rodriguez wrote:
>>> 
>>>> On 2026-09-28 01:41, Jose R Rodriguez wrote:
>>>> 
>>>>> Niltze [Hello]
>>>>> 
>>>>> I have hacked an official 'Debian Packaging for 5.15.15-2 for
>>>>> backports' and wrapped it over an reiser4 -enhanced 5.15.220
>>> 
>>> Won't an overflow occur in the third register?
>> That's why I tagged you, Sr., you are the expert ;-) Notwithstanding, 
>> approximately one week + of daily use / testing development has not 
>> introduced anomalies, except for the dmesg flooding and missing 
>> pahole-*.sh files; issues which have been resolved with integrated 
>> patches into the Debian Packaging for 5.5.220 framework.
>> 
>>> Has anyone even tried porting Reiser4/5 to newer kernels (5.17+)? As
>>> far as I remember, for this, one had to make a friendship with the
>>> newly introduced "folios"..
>> 5.15 LTS has not introduced 'folios', yet, as far as I analyzed the 
>> commits.
> Apropos, looking at my annotations from a while back, as I was 
> creating/modifying my hack of reiser4 for 5.15 LTS patch, I noticed 
> that your reiser4 for 5.16 patch does not apply cleanly to 5.15 
> *because* 'memory folios' were introduced with commit 
> 49f8275c7d9247cf1dd4440fc8162f784252c849 during the transition from 
> 5.15 to 5.16, Ed, i.e., 'memory folios' were present *already* in 5.16.
> 
>> 
>>> 
>>> Thanks,
>>> Edward.
And... lastly, if you want to 'give a spin', 'kick the tires', etc., of 
the reiser4 (SFRN 4.0.2) -enhanced 5.15.220 LTS iteration, possibly to 
provide constructive feedback[?], it has been made available now as a 
Debian Installer (d-i) ISO/USB netboot image (-lts label concatenated) 
suitable for either a virtual machine and/or bare metal installation 
[2].

I think Ian Murdock would add this 'milestone' to the history of Debian 
;-) ... even if you do not hack any more reiser4 patches, Ed.

>>> 
>>>>> LTS. During the task I added to debian/patches directory support
>>>>> for upstream RTW89 WiFi 6 module(s) and 'drm/amd/display: Avoid
>>>>> flooding unnecessary info messages' modified patch based on:
>>>>> <
>>>>> 
>>>> 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=290072065dffec1752f21c6bc7f7e5eca7aaf706
>>>>>> [1]
>>>>> 
>>>>> The build completes nicely and I am using the reiser4 5.15.220 LTS
>>>>> kernel, testing it during daily use:
>>>>> < https://metztli.it/lts > [2]
>>>>> 
>>>>> When it came time to build VirtualBox 7.2.20 during my testing,
>>>>> the
>>>>> /usr/src/linux-headers-*-common/scripts/
>>>>> package missed inclusion of
>>>>> pahole-version.sh
>>>>> pahole-flags.sh
>>>>> 
>>>>> which, of course, are part of and under 5.15.220/linux/scripts
>>>>> directory.
>>>>> 
>>>>> Question I have is, where in the Debian Packaging for x.y.z
>>>>> framework can I define the extra files missing from my current
>>>>> build?
>>>>> 
>>>>> Any hints would be appreciated very much!
>>>> 
>>>> Never mind, issue is solved by modifying
>>>> debian/rules.d/scripts/Makefile and specifying those missing files
>>>> in my Debian Packaging for 5.15.220 LTS patch, again, as just
>>>> elaborated at:
>>>> < https://metztli.it/lts > [2]
>>> 
>>> 
>>> 
>>> Links:
>>> ------
>>> [1] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=290072065dffec1752f21c6bc7f7e5eca7aaf706
>>> [2] https://metztli.it/lts

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
