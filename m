From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: bad block management
Date: Tue, 1 Apr 2008 20:55:01 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de>
References: <16413477.post@talk.nabble.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <16413477.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: kgp <jyotiv@tataelxsi.co.in>
Cc: reiserfs-devel@vger.kernel.org

On Mon, 31 Mar 2008, kgp wrote:
> How ReiserFS manages bad blocks?

Is reiserfsck's --badblocks option helpful?

> If it is not supporting bad block management, plz tell me the approches we
> can use to implement bad block management in any file system. I am
> implementing bad block manager for UDF. I want some inputs

Doesn't "Spared UDF" already provide some kind of bad block management?

C.
-- 
BOFH excuse #261:

The Usenet news is out of date
