From: "Marti Raudsepp" <marti@juffo.org>
Subject: Re: Undeletable directory in reiser4
Date: Wed, 11 Jul 2007 20:02:43 +0300
Message-ID: <2a12af650707111002i5ca3933dibeafe0ab40f2ebe0@mail.gmail.com>
References: <2a12af650707101003i660dc33fv33ff1557ee84e3e2@mail.gmail.com>
	 <4694CDA7.504@namesys.com>
	 <2a12af650707110835u5e1f0ecfwd1bf41a19fef1da3@mail.gmail.com>
	 <469503B7.0@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        b=p1NclRJd4QbelLmErXWiS7Ao/zZlFn+CeZVloBxrfbvfUqTrcDxVJQtEtHH2RDIifIRIjL9P2ovsFd7XGTWI/3XsygnbiWmM/+tfLtsflLGSEOvuM4ifg5LU7aiqd1G0z25wElJkN3ww2TYWuHaNiyeAnYQEGZ8Wprq3gOFakXs=
In-Reply-To: <469503B7.0@namesys.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 7/11/07, Edward Shishkin <edward@namesys.com> wrote:
> Would you please pack metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz

Sure: http://juffo.org/stuff/reiser4_undeletable_dir_metadata.gz

The erroneous directory is located under /vartmp/portage_bug/...
(renamed from its original "portage")

Regards,
Marti Raudsepp
