using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WebProdavnica.DataAccess.Migrations
{
    public partial class dodatekategorije : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "KategorijaId",
                table: "Proizvodi",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Kategorije",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(nullable: false),
                    ModifiedAt = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeletedAt = table.Column<DateTime>(nullable: true),
                    IsActive = table.Column<bool>(nullable: false),
                    Naziv = table.Column<string>(maxLength: 30, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Kategorije", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Proizvodi_KategorijaId",
                table: "Proizvodi",
                column: "KategorijaId");

            migrationBuilder.CreateIndex(
                name: "IX_Kategorije_Naziv",
                table: "Kategorije",
                column: "Naziv",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Proizvodi_Kategorije_KategorijaId",
                table: "Proizvodi",
                column: "KategorijaId",
                principalTable: "Kategorije",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Proizvodi_Kategorije_KategorijaId",
                table: "Proizvodi");

            migrationBuilder.DropTable(
                name: "Kategorije");

            migrationBuilder.DropIndex(
                name: "IX_Proizvodi_KategorijaId",
                table: "Proizvodi");

            migrationBuilder.DropColumn(
                name: "KategorijaId",
                table: "Proizvodi");
        }
    }
}
