From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Tue, 23 Nov 2004 11:00:26 -0800
Message-ID: <41A388CA.7000004@namesys.com>
References: <2c59f00304112205546349e88e@mail.gmail.com> <200411221759.iAMHx7QJ005491@turing-police.cc.vt.edu> <41A23566.6080903@namesys.com> <200411231011.21652.dws@steinbergnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411231011.21652.dws@steinbergnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dirk Steinberg <dws@steinbergnet.net>
Cc: reiserfs-list@namesys.com, Valdis.Kletnieks@vt.edu, Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org

Dirk Steinberg wrote:

>How about making metas a mount option? 
>
That was always the intention.  I thought it got implemented, sigh, my 
guys need smaller todo lists....

>Right now disabling metas 
>requires patching the source.
>
>/Dirk Steinberg
>  
>
You mean, enabling it requires changing a #define (if you are using the 
latest).  We changed that after bugs were found in the implementation 
that could cause crashes.

Hans
