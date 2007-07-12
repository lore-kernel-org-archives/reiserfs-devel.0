From: "Christopher Covington" <covracer@gmail.com>
Subject: Re: Undeletable directory in reiser4
Date: Thu, 12 Jul 2007 10:50:08 +0200
Message-ID: <dcdcb9a80707120150t3c03700ame7155bf758715b4d@mail.gmail.com>
References: <2a12af650707101003i660dc33fv33ff1557ee84e3e2@mail.gmail.com>
	 <4694CDA7.504@namesys.com>
	 <2a12af650707110835u5e1f0ecfwd1bf41a19fef1da3@mail.gmail.com>
	 <469503B7.0@namesys.com>
	 <2a12af650707111002i5ca3933dibeafe0ab40f2ebe0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=TEY5Fq3OKkJjPZa5s3u6Y7/6m/pxBUL4o38xMoEqTKrdis2BzwzNGyKqCkF/bxT/OFCbVhGbTeGOVTpyAUgTBzgwr/B+IelivemYkdRbh8uftyUFclNILrHJ8a6XvvxV3RPMS64duHJlrqx+9CTqjVyXsKU+fmA8KN19vrvlNQQ=
In-Reply-To: <2a12af650707111002i5ca3933dibeafe0ab40f2ebe0@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Although I don't have any useful information to report because this
happened to me a while ago and I was too lazy to report it or maybe
thought it was my own fault, I had the same problem (indeed with some
work directory of a java package on gentoo). Rebuilding the filesystem
may have fixed it,--'m relatively certain I'm rid of the annoyance now
and wouldn't have taken any steps more advanced than running fsck.

Regards,
Chris
