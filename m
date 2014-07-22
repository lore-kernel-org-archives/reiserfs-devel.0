From: "Daniel Horne" <daniel.horne@gmail.com>
Subject: Re: Reiserfs 4
Date: Tue, 22 Jul 2014 16:08:11 +0100
Message-ID: <397F6A08450F4516A04EE959B5BAD852@DuSTmanPC>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv> <53CCD8C8.4030900@niksula.hut.fi> <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC> <53CE54ED.70001@ontolinux.com> <53CE6D08.3010700@niksula.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:references:in-reply-to:subject:date:mime-version
         :content-type:content-transfer-encoding;
        bh=JaA29N/HTrUCa7oXLIckFga4KTZCCVeja+BItHgBIz0=;
        b=jjh/I+qcP5aLdCpV4W3KFpTB4xn1C9qBbVJEWbgp/RRoN0eKymi1ydfcguv8gDKW5E
         +v7l1SGbbqRIKnK97hoM3tQrPUjIZ7bTvnRICOwUouhgtJRysyOzKJGTQMDiZBlVErLv
         8j25f+HO8GEuUuj4zyyx82ncEkpBAScYWiddHaXmislEa7anzOki7dSAOyxj/ktIwnQp
         /BODPQrEqZuyJ+mC7AEhypCqB2dyf5swyppIKj6+Pw2r1fBUpZfj/A/1rb3GhdRFcu82
         jci+q1/igVTYJiVp15d1I4ot9QiLqZ4bffi0ZVapFxrtZ/tmlo+bL1r1vsB4QrUM9U9Z
         hTkg==
In-Reply-To: <53CE6D08.3010700@niksula.hut.fi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

> On a related note - I think formally verified R4 is great idea but you've 
> got to be
> aware that as long as it's running on top of unverified Linux kernel we 
> can only
> assure that some properties hold under the assumption that kernel actually 
> does the
> right thing. Not sure how practically viable it is outside of general 
> academic curiosity.

True enough. The SeL4 verification apparently took on the order of a few 
manyears, and we don't have that. I do think, however, there's likely to be 
value in incomplete efforts. I personally know that I've had bugs in my code 
that I've spent a couple of days trying to iron out, only to find that when 
I stop and write out hoare triples for each of the statements in the code I 
find the issue in about ten minutes.

We can start with a highly abstract model and gradually introduce more 
details while establishing that each more detailed model doesn't invalidate 
proofs made on more general ones. Having a proven yet highly abstract model 
to informally compare the actual source to would make debugging quite a bit 
easier, I think, and we could gradually build on it to reduce the semantic 
"distance" between the model and the kernel code.

--
DH 

