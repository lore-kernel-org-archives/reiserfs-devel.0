From: "Alec H. Peterson" <ahp@hilander.com>
Subject: Re: Reiser4 unlink performance
Date: Tue, 28 Feb 2006 12:19:32 -0700
Message-ID: <5630744B-8F94-4B23-A228-999F04BD3E58@hilander.com>
References: <EE7B7176-15E7-43E9-937B-B084879E62A9@hilander.com> <200602262342.23069.zam@namesys.com> <15967723-4F4C-47DF-A621-CEE29E4C6244@hilander.com> <4404A04F.5010902@namesys.com>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4404A04F.5010902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

Hi Hans,

On Feb 28, 2006, at 12:11, Hans Reiser wrote:

> Please describe it in more detail.

Well, the error I'm getting is this:

Feb 21 13:10:22 ecbuild-10 kernel: WARNING: Flushing like mad: 16384

The C program I'm running to do the test is this:

main(int argc, char **argv)
{
   char buf[1024];
   char dir[1024];
   int i,j,k;
   int ret;
   int fd;
   int *sequence;
   struct timeval start, unlinktime, end;

   if(argc != 2)
   {
     fprintf(stderr, "Usage: %s <base directory>\n", argv[0]);
     exit(1);
   }

   strncpy(dir, argv[1], 1024);

   if(chdir(dir))
   {
     perror("chdir");
     exit(1);
   }

   for(i = 0; i < 256; i++)
   {
     snprintf(buf, 1024, "%d", i);
     ret = mkdir(buf, S_IRWXU);
     if(ret && (errno != EEXIST))
     {
       perror("mkdir");
       exit(1);
     }
   }


   {
     sequence = sequence20000;
     gettimeofday(&start, NULL);
     fprintf(stderr, "Starting %d run %d.%d.\n",
             256 * 20000, start.tv_sec, start.tv_usec);

     for(i = 0; i < 256; i++)
     {
       for(j = 0; j < 20000; j++)
       {
         snprintf(buf, 1024, "%d/%d", i, j);
         fd = open(buf, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
         if(fd == -1)
         {
           perror("open");
           exit(1);
         }
         close(fd);
       }
       fprintf(stderr, "Done %d\n", i);
     }

     gettimeofday(&unlinktime, NULL);
     fprintf(stderr, "Starting %d unlink %d.%d, elapsed time was %d.\n",
             256 * 20000, unlinktime.tv_sec, unlinktime.tv_usec,
             unlinktime.tv_sec - start.tv_sec);

     for(i = 0; i < 20000; i++)
     {
       for(j = 0; j < 256; j++)
       {
         snprintf(buf, 1024, "%d/%d", j, sequence[i]);
         unlink(buf);
         if(fd == -1)
         {
           perror("unlink");
           exit(1);
         }
       }
       fprintf(stderr, "Done %d\n", i);
     }

     gettimeofday(&end, NULL);
     fprintf(stderr, "Done with %d unlink %d.%d, elapsed time was %d. 
\n",
             20000 * 256, end.tv_sec, end.tv_usec,
             end.tv_sec - unlinktime.tv_sec);
   }

   exit(0);
}

sequence20000 is an array which contains a sequence from 1 to 20000  
randomly ordered.

Alec

