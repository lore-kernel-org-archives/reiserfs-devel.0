From: "Daniel Horne" <daniel.horne@gmail.com>
Subject: Re: Reiserfs 4
Date: Tue, 22 Jul 2014 16:08:44 +0100
Message-ID: <8EA7D2C1883A4317A8DC0A79836C7482@DuSTmanPC>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv> <53CCD8C8.4030900@niksula.hut.fi> <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC> <53CE54ED.70001@ontolinux.com> <53CE6D08.3010700@niksula.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:references:in-reply-to:subject:date:mime-version
         :content-type:content-transfer-encoding;
        bh=JaA29N/HTrUCa7oXLIckFga4KTZCCVeja+BItHgBIz0=;
        b=eUnop+ELR0NfYoIGsHSgVufx1AonbflZ0prFe6rZ82+E83/kBoMtvPvFLPIMeBn7Nl
         Jmx+PixSZIbnsgvJyQPocHp6uhg6R7hMmtJeCtKHOZONhaa79S3OdvjNX18NhbUd66x2
         bsd1zwjSeWdx9oKAEuQSrjro/GBgr77oCQhrLeUpjRFV82WeeZp0gCqm8fbWFqqJ6x8u
         2trJStioDcO1li1PQpvpaPk/WgPLTHTy+PQq1hTr0/ZnZDPAWvhqHnY45XsiZgvUAeL4
         naWlr/FMDNEn5PgOF8ufLB+edb5QnHzU/fBsv830qPWG0Fc6wcDt7LHXJMntOyAnwHo0
         XjRA==
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

