From: "Christopher Sawtell" <csawtell@gmail.com>
Subject: OpenAFS on Reiser4
Date: Sat, 15 Mar 2008 17:59:04 +1300
Message-ID: <b8d16a880803142159h61dffabewed8870dd889af8b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=Z7aocp27MJU6Ojx6Cru7Mb8goLZnzk5py6KoTWLRRFQ=;
        b=MfJ5t/UQPpbnehF4ewuFccg0RMn36Zd+Tc1hTqtAUGPl2+6sll+zdHaR3wDaXEX+yUqIT2CLwnYeJHwzZ/2ShoBJOex3CRiLsRzhYrbWmnxrB5C0/j6kNbtdlxof0elIOUhUaFS8G3RhRUAgUmhbO1pE9OSskOALa9PgEXcsQLg=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

I'm trying to set up an OpenAFS node on a machine which happens to be
running Reiser4.
The OpenAFS doco has dire warnings about running it with its cache on
a ReiserFS partition.
Do these warnings apply to the Reiser4 filesystem as well?

Many thanks in advance.

--
Sincerely etc.
Christopher Sawtell
