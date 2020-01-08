From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
Date: Wed, 8 Jan 2020 15:42:58 -0800
Message-ID: <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
References: <20200108193634.GA17390@netestate.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fzCIX28C4ZAC3u5qLAUDVcEdFKR+Sd0vbPoA2LC1SLo=; b=unEY8eZyBDUlUUgSjehECSefM
        EzW+niSQLElUiK2BUPNlO87WoFdIuL5PZFYcS0E9tIE9jXT4pCRSJksAwY+ADVKc/gQMySCe1tL6a
        IFsm2PcJLVq9fpjgTZrarTVXxPA39KsFwDKcZl7gptdgYEEx17JDCJB0G3JGtCVBihkDw9KUeazVF
        rUJVa9P5DrNBtI+rrO13g/g4qbJVjZBEnmfndVWg5VNESl5c9RZjMfb6O1k+5k+F1iYirOTB+4wUk
        beJW8dxyn5MRf8UPnFFAq8ec7IX2gjc/6Ne7vQS7Sol/KzQ6AMot4lZ+oAIqW8TQNs6XdQ7VO4R70
In-Reply-To: <20200108193634.GA17390@netestate.de>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Brunnbauer <brunni@netestate.de>, linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

On 1/8/20 11:36 AM, Michael Brunnbauer wrote:
> 
> hi
> 
> after upgrading from 4.9.205 to 4.9.208, I get errors on two different
> reiserfs filesystems when doing cp -a (the chown part seems to fail) and
> on other occasions:
> 
>  kernel: REISERFS warning (device sda1): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-95)
> 
>  kernel: REISERFS warning (device sdc1): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-95)
> 
> This behaviour disappeared after a downgrade to 4.9.205.
> 
> I understand there have been changes to the file system code but I'm not
> sure they affect reiserfs, e.g.
> 
>  https://bugzilla.kernel.org/show_bug.cgi?id=205433
> 
> Any Idea?
> 
> Regards,
> 
> Michael Brunnbauer
> 

Looks to me like 4.9.207 contains reiserfs changes.

Adding CC's.

-- 
~Randy

