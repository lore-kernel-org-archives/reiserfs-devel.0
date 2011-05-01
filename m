From: dE <de.techno@gmail.com>
Subject: Corruption with Gentoo's PORTAGE_TMPDIR
Date: Sun, 01 May 2011 21:18:31 +0530
Message-ID: <4DBD80CF.9070903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=NI/qWij8TDFtEKFRmOm6/XRjiq0MJSkLs9yKNMuTSkQ=;
        b=hPBoqqr0i7f/Sa7JXpz+Km07Si4op6eg/KCSFVDK+zpGHQj3hi74U25nOAa9WX0fu0
         2H1Gi4TmFau3H7xxkphrNmXvoZvpbFfuhD/c/lJ0A+7KFJyO7xuFjUzfsCx1VvXvvzoc
         bqltI5rxLaGXHC09th0anztjfoB5UXJ5Jj5MQ=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi.

I've started using reiser4 for a couple of months I've experienced a few 
crashes which appear to relate themselves directly to reiser4, however 
they're not reproducible.. but one thing is.

I'm using Gentoo with vanilla kernel 2.6.37 and Zen patches.

I reported a bug for a compile time failure of a java related package -
http://bugs.gentoo.org/show_bug.cgi?id=365503

The problem resolved when I mount binded a xfs partition to 
PORTAGE_TMPDIR directory.

If you want I can attach the both the PORTAGE_TMPDIR (one in xfs, the 
other in reiser4)
