From: Ric Wheeler <ric@emc.com>
Subject: Re: bad block management
Date: Tue, 01 Apr 2008 15:32:53 -0400
Message-ID: <47F28DE5.1060402@emc.com>
References: <16413477.post@talk.nabble.com> <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de>
Reply-To: ric@emc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Kujau <lists@nerdbynature.de>
Cc: kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org


Christian Kujau wrote:
> On Mon, 31 Mar 2008, kgp wrote:
>> How ReiserFS manages bad blocks?
> 
> Is reiserfsck's --badblocks option helpful?
> 
>> If it is not supporting bad block management, plz tell me the 
>> approches we
>> can use to implement bad block management in any file system. I am
>> implementing bad block manager for UDF. I want some inputs
> 
> Doesn't "Spared UDF" already provide some kind of bad block management?
> 
> C.

I am not sure what you want to do with bad block management.

With most modern disk drives, they will remap bad disk sectors dynamically for 
you so the file system layer can stay out of the bad block mapping business 
entirely.

ric
