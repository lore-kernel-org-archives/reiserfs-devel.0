From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: Re: Could reiserfsprogs display volume labels when doing fsck upon
 boot?
Date: Sat, 15 Oct 2005 13:19:20 +0100
Message-ID: <4350F3C8.3070600@darthvader.us>
References: <434F7D17.1030203@people.pl> <200510141607.21066.vitaly@namesys.com> <200510141507.29640.rmeijer@internet.gr> <200510141620.28514.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510141620.28514.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Friday 14 October 2005 16:07, Raymond A. Meijer wrote:
>  
>
>>On Friday 14 October 2005 15:07, Vitaly Fertman wrote:
>>
>>[...]
>>
>>    
>>
>>>ok, I will add it.
>>>      
>>>
>>Vitaly, is it possible to add labels to Reiser4 filesystems AFTER mkfs, 
>>or only during mkfs?
>>    
>>
>
>only on mkfs time for now.
>
>  
>
For reiser4, would this do it?
in function *reiser4_master_open(aal_device_t *device) in
libreiser4/master.c

  /* Reiser4 master super block is not found on the device. */
        if (aal_strncmp(SUPER(master)->ms_magic, REISER4_MASTER_MAGIC,
                        sizeof(REISER4_MASTER_MAGIC)) != 0)
        {
                aal_fatal("Wrong magic found in the master "
                          "super block.");
                goto error_free_master;
        }
        /* Print volume label */
        aal_mess(reiser4_master_get_label(master));

        return master;

 error_free_master:
        aal_free(master);
        return NULL;


Stab in the dark :P
