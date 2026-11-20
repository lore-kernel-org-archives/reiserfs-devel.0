Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135545;
	b=liA5Eh8ZLBvSkk7kxQCOouNYZEv0pUZRXx+HMNI/L0JEujbzyfVrAXZCFDfR58NvpX+H
	 HGBXw1GNB6aYVIevVM3AG/LYDboGHTkUWhmKoqP/aXO04AVTXxjWvEb1I8giQ/weMMhk+
	 R5ck9nK9xi2ebRSVw9gOsIeRd+I43FYC5gDggtbK9NvVr04b0dRRefyWIH67Tfc9MPEEY
	 U5cpxIlKOEbP52lrWswYcB16fnQmXwPyEZFwNMhs053Nrg2DLQnU6TEd3kwR50P+i+rSi
	 jMc1MBksNpM2nbOkZX+JeJcKgNiXRUD04qBouGq3ht90iSWx0fDblJNmaizGe/E4FAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=9fC7cg6sGw4Bs3p5ginf7FsDO1egItUtI2jmXtYH5xQ=;
	b=cu54KDOiuLFPo+b62sWfu1eyVO7/D3OUN5NeRRfUwAdSvaMMxiLe3/y5TX8wyhPlQGd7
	 iJlAwPl+esIyn+/+iMLIeGLjlsdShOExdqDfaPxQViCjiYJdcCtO6eIUYqD0uB5xisRNW
	 sLlhwyEiF/b38qr2d6eDdFTN5G67cxUjZnKRrSfEh2SB7Q+2TkjtnJir8Sk8sZzXhhUUa
	 2Crhj3PAGaoJYISNGJiYd/gqoeprbZE7Od35eYdwYvRhWuHLdA+znICT6WwXTXZKpNinQ
	 9he9nS5+u2HBeWtflHOQgCQK0oMxQVkvC7r9ot3vozRwVlYAWtPh1lSfSb8ykakftdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=(null) smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=wKuEh1Qc;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EA606A326
	for <reiserfs-devel@vger.kernel.org>; Fri, 20 Nov 2026 00:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=wKuEh1Qc
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id DC41C14C2D6;
	Fri, 20 Nov 2026 01:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1795135540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fC7cg6sGw4Bs3p5ginf7FsDO1egItUtI2jmXtYH5xQ=;
	b=wKuEh1QceRTitEUQpu+RThFyq6N+TtS87iEhBA899BhVvoaNtg4cmqRrfTVhICKwWukvF+
	YvAfFIsv6uvnsSyqKjZ24XGo8w+KgN1u7vdtNdEJZvCFOvAMM/o8sCUjDQQfQqRBx12gQb
	+RvqEmL6s6eOc4/3ek8l0lQmjuwKuHZFqoEtyXXliwOeHzYaerYSPyWFUlG89t2bX4OAFv
	zHn85+4dDOmrwvqLdGTilOsPV6YcWBnjUyp4skq+ILLVmIlH7+g0J14PRxG8p4jt1M6P1u
	5vtdU5VreqC5S8r2dei5nHMXyV+ET1bkemtwIyyp9sYsnhFjIUi4sh8QEKE8Rw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 54ea6d8a;
	Fri, 20 Nov 2026 00:45:37 +0000 (UTC)
Date: Fri, 20 Nov 2026 09:45:22 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jose R Rodriguez <jose.r.r@metztli.com>,
	oss-security@lists.openwall.com
Cc: Greg KH <greg@kroah.com>, Edward Shishkin <edward.shishkin@gmail.com>,
	Reiserfs Devel <reiserfs-devel@vger.kernel.org>
Subject: Re: [oss-security] NoisyTCP =?utf-8?B?4oCU?=
 =?utf-8?Q?_CVE-2026-99288_=28Was_Re=3A_=5Boss-security?= =?utf-8?Q?=5D?=
 Backports available - cBPF JIT spray hardening)
Message-ID: <av-YIntXr75-vmym@codewreck.org>
References: <dzp2vbih7jcsxjmcnxnefgi435b7re4kwxvxmvlxrmkra2p5br@vv5ckstkijym>
 <14ad9b085cb3fb4b3a9fc091dde74540@metztli.com>
 <6mqqzqzujeduybqeojfh7tmblksmqjksocri5ayeudze6l4fqm@ijx64jfxrwbt>
 <2026073004-spruce-clambake-1785@gregkh>
 <49ce58fc228f99240f9c3658622ca2d6@metztli.com>
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Post: <mailto:reiserfs-devel@vger.kernel.org>
List-Help: <mailto:reiserfs-devel+help@vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:reiserfs-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49ce58fc228f99240f9c3658622ca2d6@metztli.com>

Hi Jose,

(not sure why this comes as a reply to the bpf hardening CVE..)

Jose R Rodriguez wrote on Thu, Nov 19, 2026 at 03:25:25PM -0800:
> Since the time of your comment I have been keeping up with reiser4 -enhanced
> 5.15 LTS build iterations -- with the latest being 5.15.224.
> Notwithstanding, 'NoisyTCP — CVE-2026-99288' came along and the latest
> 5.15.225 LTS iteration did not address the critical vulnerability. I have
> the 5.15 LTS kernel(s) deployed online and I got spooked. Accordingly, on a
> best effort basis, I backported the patch from upstream:

The patch "inet: reject unhashed sockets during established lookups"
marked as fixing this CVE already has been backported to older trees,
including 5.15 already and is in the 5.15.226-rc1 (which will likely be
released today (11/20) or tomorrow)

You can already pull the patch from
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
if you want to rebuild your own kernel early


OTOH if you want quick fixes it's best to upgrade to a newer release if
possible - except for embedded or platforms with specific hardware it's
generally not too hard to switch to the latest LTS.

-- 
Dominique Martinet | Asmadeus
