From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: integrity question
Date: Mon, 27 May 2002 10:35:24 +0100
Message-ID: <200205271035.24379.tdickenson@geminidataloggers.com>
References: <200205252043.29257.tdickenson@geminidataloggers.com> <20020526052550.GA5056@atou.qc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020526052550.GA5056@atou.qc.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jean-Francois Landry <jflandry@atou.qc.ca>
Cc: reiserfs-list@namesys.com

On Sunday 26 May 2002 6:25 am, Jean-Francois Landry wrote:

thanks for your time,

>> 1. write to A/B/somefileX and fsync it
>> 2. mkdir A/C
>> 3. rename A/B/somefile to A/C/somefile
>> 4. rmdir A/B
>> 5. power loss
>>
>> I would like to guarantee that, after journal replay, 'somefile' is in
>> either of those two directories (or both). Am I correct to think that I
>> dont need any other syncs in there?
>
>You are correct, renames are atomic on journalling filesystems.
>So, no problems with half-written directory entries, if you lose power
>at the wrong time the journal replay procedure will throw the
>transaction out and you end up as if you never issued a rename at all.

Atomic rename isnt quite enough in the scenario I described. The filesystem 
also needs to take care that the step 3 is not committed before step 2, and 
that step 4 is not committed before step 3.

>I can't point to specific documentation, but this behavior is part of
>the main ideas behind journalling filesystems.

I would be very happy to find that I am worrying over a problem that does not 
exist.
