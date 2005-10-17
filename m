From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: Re: Could reiserfsprogs display volume labels when doing fsck upon
 boot?
Date: Mon, 17 Oct 2005 11:21:52 +0100
Message-ID: <43537B40.4070705@darthvader.us>
References: <434F7D17.1030203@people.pl> <200510141620.28514.vitaly@namesys.com> <4350F3C8.3070600@darthvader.us> <200510171403.51384.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510171403.51384.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Vitaly Fertman wrote:

>>For reiser4, would this do it?
>>in function *reiser4_master_open(aal_device_t *device) in
>>libreiser4/master.c
>>
>>  /* Reiser4 master super block is not found on the device. */
>>        if (aal_strncmp(SUPER(master)->ms_magic, REISER4_MASTER_MAGIC,
>>                        sizeof(REISER4_MASTER_MAGIC)) != 0)
>>        {
>>                aal_fatal("Wrong magic found in the master "
>>                          "super block.");
>>                goto error_free_master;
>>        }
>>        /* Print volume label */
>>        aal_mess(reiser4_master_get_label(master));
>>
>>        return master;
>>
>> error_free_master:
>>        aal_free(master);
>>        return NULL;
>>
>>
>>Stab in the dark :P
>>    
>>
>
>I would put it into fsck after fs gets opened to not force 
>all callers to get this message. 
>however, 'fsck.reiser4 -a' does not perform any check yet 
>and does not even open fs.
>
>  
>
Hello Vitaly,

Thanks for the info. Here is where I show my ignorance so bear with 
me..Can the caller be "identified" somehow? Say for
example, a mount operation or an fsck, then output the system label if 
there is one..or does this sort of cosmetic touch not fit
in libreiser?

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
