From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 3/6] ext4: Handle error from dquot_initialize()
Date: Wed, 15 Jul 2015 10:20:26 -0400
Message-ID: <20150715142026.GB18400@thunk.org>
References: <1436964152-11203-1-git-send-email-jack@suse.com>
 <1436964152-11203-4-git-send-email-jack@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org; s=ef5046eb;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=OzraG2JybR7yj2aAY5TnaheATOB2jDzhjpW7CI2GHpU=;
	b=HlaHBOZZI4yTM9S/Ox8+ur1G0RBxrB24F8jgzhPQOCmBNdYhHZ86EkAfD4pTVO0rH03uq1uh2No4+WLKzpraQPcuJrUI3SNwZMPoHkIExWtvyIDORN2yDumnLTOmj89FzGlpt81Seh1xokMjIesq9hJGXR5aqNrOI/2/3ITjwH4=;
Content-Disposition: inline
In-Reply-To: <1436964152-11203-4-git-send-email-jack@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, ocfs2-devel@oss.oracle.com, Mark Fasheh <mfasheh@suse.com>, Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org

On Wed, Jul 15, 2015 at 02:42:29PM +0200, Jan Kara wrote:
> dquot_initialize() can now return error. Handle it where possible.
> 
> Signed-off-by: Jan Kara <jack@suse.com>

Thanks!!

Acked-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
