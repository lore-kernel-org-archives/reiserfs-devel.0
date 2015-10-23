From: Morgan Smith <m2@intersafeit.com>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Fri, 23 Oct 2015 10:07:51 -0600
Message-ID: <562A5B57.4090706@intersafeit.com>
References: <n0b6ql$6t4$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=intersafeit.com;
	s=default; t=1445616472;
	bh=hvLZR4r/F0bilJAja2qG7FDPAGGTavkxNpTW3rXEtTY=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=o8+I721CcmwO+JB2M50nr36KqPqpmOt/FpIIPdNQertZ7gNhRap+VZGK1rwzA3DvU
	 ec5cy72UT9IEMdcfRwvH1Gkl4yUO3tiiJrVNq0yRP42dIkxSPPsMZn3txXfaS7mzyw
	 CnJ/dDGKB5HLXgOBBGoVCP6ip7LLptwwvDHjNKNo=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=intersafeit.com;
	s=default; t=1445616472;
	bh=hvLZR4r/F0bilJAja2qG7FDPAGGTavkxNpTW3rXEtTY=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=o8+I721CcmwO+JB2M50nr36KqPqpmOt/FpIIPdNQertZ7gNhRap+VZGK1rwzA3DvU
	 ec5cy72UT9IEMdcfRwvH1Gkl4yUO3tiiJrVNq0yRP42dIkxSPPsMZn3txXfaS7mzyw
	 CnJ/dDGKB5HLXgOBBGoVCP6ip7LLptwwvDHjNKNo=
In-Reply-To: <n0b6ql$6t4$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Georgios Tsalikis <georgios@tsalikis.net>, reiserfs-devel@vger.kernel.org

I had this behavior a couple years in the past and in my case this was
due to some metadata being sought and read at mount time. There was a
mount option to disable that behavior though I haven't used it in a long
time and cannot remember the option however Q19 this gentoo forum
reiser4 faq [1] suggests that it was the dont_load_bitmap mount option.
I do not know if such an option is still available for the current version.

[1] https://forums.gentoo.org/viewtopic-t-706171.html

On 10/22/2015 11:38 AM, Georgios Tsalikis wrote:
> The filesystem is 1.7GB large, lies in a GPT patition and is formated
> with -o node=node41 without any other override. The kernel is 4.2.3 with
> the 4.2.2 patch.
> I tried the same on a 250MB partition and it mounts instantly. dmesg
> shows nothing special
> Any ideas? Thanks in advance. :)
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
