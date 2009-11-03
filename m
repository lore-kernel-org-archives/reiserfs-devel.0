From: =?UTF-8?B?7ZmN7IugIHNoaW4gaG9uZw==?= <hongshin@gmail.com>
Subject: BUG? a suspected race bug at check_journal_end()
Date: Tue, 3 Nov 2009 22:08:07 +0900
Message-ID: <2014bcab0911030508s5fe0ae8dvde4631108d8eb2b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=KPhW03A4TeGcPa4c9geSDrwIK+IB2PE2EG7uZLpdpMA=;
        b=tS2DrbScYkmNzRyeItVvK6zit73vrOEq9mvfAcm4Gjx+NRCVllFTKVoq1mPSoKGz+Y
         NE2DNcjZYCAYNIx8mjAQACeIvL+zIlGE0V0A2BI9nPwSymLVMLPl2a5FW0M1cH0xbeOT
         Lj4jd7VWwaYCIXkFYG7QhMJKvAcHwsgeoakhE=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hello. I am reporting atomic instructions usages
which are suspected to be misused in reiserfs/journal.c
of Linux 2.6.31

I do not have much background on reiserfs
so that I am not certain whether it is correct or not.
But I hope this report is helpful. Please examine the code.

In check_journal_end(), there are following codes:

    if (atomic_read(&(journal->j_wcount)) > 0) {
        atomic_dec(&(journal->j_wcount)) ;


It first checks journal->j_wcount and then increments its value by one.

If a function which changes journal->j_wcount executes concurrently
for the same journal->j_wcount, race condition might be possible.

I think it would be better to combine two atomic operations
into one atomic operation (e.g. atomic_dec_and_test)

Thank you.

Sincerely
Shin Hong
