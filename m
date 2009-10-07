From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: [patch 4/4] reiser4: reduce frame size of reiser4_init_super_data
Date: Wed, 07 Oct 2009 21:45:14 +0200
Message-ID: <4ACCEFCA.9070106@free.fr>
References: <4AC9407C.2050105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4AC9407C.2050105@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: akpm@linux-foundation.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hi Edward,

This patch is buggy, isn't it ?

I've got 2 reiser4 FS in my /etc/fstab:

/dev/vglinux1/lvkernel-r4 /home/laurent/kernel reiser4 defaults,noatime,nodiratime,tmgr.atom_max_size=2048 0 0
/dev/disk/by-uuid/b8dbe880-b664-49aa-8050-bddc91fd5e49 /mnt/diske reiser4 noauto,users,noatime,nodiratime 0 0

The first FS can't be mounted:

[  235.078342] reiser4[mount(4205)]: parse_options (fs/reiser4/init_super.c:253)[nikita-2307]:
[  235.078345] WARNING: Unrecognized option: "tmgr.atom_max_size=2048"

although the second one can be mounted:

[ 3152.046324] reiser4: sda7: found disk format 4.0.0.


Let's have a look at the code in fs/reiser4/init_super.c:


392 int reiser4_init_super_data(struct super_block *super, char *opt_string)
393 {
394         int result;
395         struct opt_desc *opts, *p;
396         reiser4_super_info_data *sbinfo = get_super_private(super);
397 
...
442         p = opts;
443 
444         push_sb_field_opts(p, opts, sbinfo);

p is passed by value to push_sb_field(). push_sb_field() does increment 
its local copy of p, but here p remains equal to opts.

...
501         result = parse_options(opt_string, opts, p - opts);

3rd argument is 0 because p==opts. Now let's have a look at parse_options()

230 static int parse_options(char *opt_string, struct opt_desc *opts, int nr_opts)
231 {

nr_opts always == 0 here.

232         int result;
233
234         result = 0;
235         while ((result == 0) && opt_string && *opt_string) {

I assume opt_string is not null (opt_string == "tmgr.atom_max_size=2048" ?), 
so let's loop:

236                 int j;
237                 char *next;
244                 for (j = 0; j < nr_opts; ++j) {

nr_opts == 0, so we won't do any iteration here.

245                         if (!strncmp(opt_string, opts[j].name,
246                                      strlen(opts[j].name))) {
247                                 result = parse_option(opt_string, &opts[j]);
248                                 break;
249                         }
250                 }

here, j==0 and nr_opts==0.

251                 if (j == nr_opts) {
252                         warning("nikita-2307", "Unrecognized option: \"%s\"",
253                                 opt_string);
254                         /* traditionally, -EINVAL is returned on wrong mount
255                            option */
256                         result = RETERR(-EINVAL);

oops !

~~
laurent
