Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DE327BFA
	for <reiserfs-devel@vger.kernel.org>; Tue, 14 Jul 2026 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.13.31.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006939; cv=none; b=JbvVfVpZuxS040V1oB7DYd+JzwKh70HY+LmytH1OpQ5SOjPoOhRF70SwQIf6xP06VXDmr0u33eJLiN+rLYQceFQD1PHpkvLwPHByqTn65cXt1OLsqnS+kNu9y2UUbk6voQzV05nmGrVElSOO+5KoJ9QMXeXedLgaoxVIFz0oULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006939; c=relaxed/simple;
	bh=Y1tSWKGfI4lmtPDv+KvRkU5kE73kfvnU4qyp+0TaJTU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g/OkxQ4m2Uw3e8Nw7NS1UydI0Rnaec+YzhJDK5z9LjJZyBqCB3JoGU9S/riWi5nro92HPAsI92eNlX+opZQTFZkiLLarUN4XwjtzIza72NsiRUf+uENTjjaIrLyKEZspip7Y/r5eV/tdmJ4mYbAawmouVJR+p8US7SMdeCsxlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=qcWFT3zb; arc=none smtp.client-ip=103.13.31.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b="qcWFT3zb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y1tSWKGfI4lmtPDv+KvRkU5kE73kfvnU4qyp+0TaJTU=; b=qcWFT3zb1nXEVf41481vv4soEc
	TAtEMSSTzyJpsRIPozmxBPN6d2f9EbwpBeuLq83Pvd1DRdgZDIH48sqkge4hqWxKCApY8c2UM1h/E
	QcF9i6ue/tZnPjLs9uri5H2/fA6Obp4NIkA1Vn4L/7jluJVreIg0U7qiPl2l3OIG9/hKjPqMbgi42
	mAJpCv5PIONBZrhONomIakwLT1+0DvZcfwENzgrOYID1S7uK65uwADpkaDrnoXing84TsasCEWY7T
	oZHgW00JMv49gPIoSqx2EeTpLj6MyMm1++MRxvVWX9/A5EosRJpC8RIEFA1E48P8jQA7xSkqtql2N
	pDyA14KQ==;
Received: from [207.189.26.187] (port=64610)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVhR-0000000G0Iu-0sIV
	for reiserfs-devel@vger.kernel.org;
	Tue, 14 Jul 2026 12:28:56 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: reiserfs-devel@vger.kernel.org
Subject: Dear reiserfs-devel@vger.kernel.org, project stage
Date: 14 Jul 2026 00:28:52 -0500
Message-ID: <20260714002852.2BA2C00C92C0B361@inbox.org>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 


Re:Good day reiserfs-devel,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA


